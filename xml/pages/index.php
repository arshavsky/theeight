<?php
	$params = array('current-url' => $_SERVER['REQUEST_URI']);

  	$xml = new DOMDocument;
	$xml->load('eight.xml');

	$xsl = new DOMDocument;
	$xsl->load('../blocks/_gather.xsl');

	$proc = new XSLTProcessor;
	$proc -> registerPHPFunctions();
	$proc->importStyleSheet($xsl);

	foreach ($params as $key => $val)
	$proc->setParameter('', $key, $val);

	echo $proc->transformToXML($xml);
?> 