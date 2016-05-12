/*https://github.com/engel731/Livre-or.git
Fait par Bazire Tanguy (engel731) le 03/05/2016
Document openSource fait en JQ*/

$(function() {
	/*Envoie l'index (indiqué dans l'id) 
	du premier et dernier commentaire courant en objet littéral*/
	function getIndex() {
		//Envoie l'index du premier commentaire
		var first = function() {
			var id = $('#container article:first').attr('id');
			return (id ? parseInt(id.split('-')[1]) : 'undefined');
		},
	
		//Envoie l'index du dernier commentaire
		last = function() {
			var id = $('#container article:last').attr('id');
			return (id ? parseInt(id.split('-')[1]) : commentLen + 1);
		};

		return {first: first(), last: last()};
	}
	
	/*Envoie le commentaire correspondant à 
	l'index dans un string*/
	function getComment(index) {
		var content = '';
		
		$.ajax({
	        type: 'GET',
	        url: 'scripts/comment.php?index=' + index, 
	        async: false,
	    	success: function(data) { content = data; }
	    });  

		return content;
	}
	
	//Contrôle la présence ou non des flèches (next, back)
	function controlArrow() {
		//Flèche Next
		if(getIndex().last <= 1)
			$('#flecheLivre > .bas').hide('fast');
		else 
			$('#flecheLivre > .bas').show('fast');

		//Flèche Back
		if(getIndex().first >= commentLen)
			$('#flecheLivre > .haut').hide('fast');
		else 
			$('#flecheLivre > .haut').show('fast');
	}

	//Script Global------------------------------------------------
	
	//Constante ayant pour valeur le nombre total de commentaire
	var commentLen = 5;

	/*Insère un nouveau commentaire à la  
	suite du dernier commentaire courant*/ 
	$('#flecheLivre > .bas').click(function() {
		$('#container article:first').css('opacity', '0');
		$('#container article:first').animate({height: '0'}, {duration: 800, complete: function() {
			//Supprime le premier commentaire courant
			$('#container article:first').remove();
			
			//Calcule l'index de l'article suivant
			var content = getComment(--getIndex().last);
			$(content).appendTo('#container')
					  .hide()
					  .slideDown(1000);
			
			controlArrow(); //Appelle le "ctrl" de flèches
		}});
	});

	/*Insère un nouveau commentaire précedent  
	le premier commentaire courant*/ 
	$('#flecheLivre > .haut').click(function() {
		$('#container article:last').css('opacity', '0');
		$('#container article:last').animate({height: '0'}, {duration: 800, complete: function() {
			//Supprime le dernier commentaire courant
			$('#container article:last').remove();

			//Calcule l'index de l'article précèdent
			var content = getComment(++getIndex().first);
			$(content).prependTo('#container')
					  .hide()
					  .slideDown(1000);
			
			controlArrow(); //Appelle le "ctrl" de flèches
		}});
	});
	
	//Constante ayant pour valeur le nombre total de commentaire courant 
	var currentCommentLen = 2;

	/*Insère deux nouveaux commentaires à la 
	suite du dernier commentaire courant*/
	for (var i = 0; i < currentCommentLen; i++) {
		//Calcule l'index de l'article suivant
		var content = getComment(--getIndex().last);
		$(content).appendTo('#container');

		controlArrow(); //Appelle le "ctrl" de flèches
	};
});