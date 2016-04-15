<?php
$textfile = 'subs.txt';
@ $fileopen = fopen('../data/' . $textfile, 'a');

if (!$fileopen) {
	echo "Failed to open file";
	exit;
}else{
	$inputvalue = 'test <br />';
	fwrite($fileopen, $inputvalue);
}
?>
