<?php
	/*https://github.com/engel731/Livre-or.git
	Fait par Bazire Tanguy (engel731) le 03/05/2016
	Document php openSource. Apy utiliser :  DOM, XSL*/
	
	$xmlFile = 'comment.xml';
	$xslFile = 'comment.xsl';
	 
	$domObject = new DomDocument();
	
	if(!file_exists($xmlFile)) 
		exit('Failed to open'. $xmlFile);
	
	$domObject->load($xmlFile); // Chargement de la source XML
	
	$xslObj = new DomDocument();
	
	if(!file_exists($xslFile)) 
		exit('Failed to open'. $xslFile);
	
	$xslObj->load($xslFile);
	
	// Configure le transformateur
	$proc = new XSLTProcessor;
	$proc->importStyleSheet($xslObj); // Attachement des règles xsl

	$proc->setParameter('', 'index', $_GET['index']); // Envoie du parametre
	echo $proc->transformToXML($domObject); 
?>