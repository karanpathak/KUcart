<?php 
error_reporting(0);
if(isset($_POST['preview']))
{
echo'
<div align="center">
<h2>YOU POSTED</h2>'. $_POST['title'].'<br><br><br>'.stripslashes($_POST['myTextArea']).'</div>';
}
if(isset($_POST['rtf2html']))
{include 'parser.php';

$r = new rtf( stripslashes($_POST['myTextArea']));
		$r->output( "xml");
		$r->parse();
		if( count( $r->err) == 0) // no errors detected
			echo $r->out;}
?>
