<?php
/****************************************************/
/*				TrinityCore 4.3.4 CMS				*/
/****************************************************/
/*	repo: https://github.com/Bender103/tc434cms		*/
/****************************************************/
/*	Main Developer: Bender Gabor					*/
/*	https://github.com/Bender103					*/
/****************************************************/
$sessionid = session_id();
if($sessionid == ""){
  session_start();
}

$sessionid = session_id();
if ($sessionid == '') session_start();
if (!isset($_SESSION['safety'])){
    session_regenerate_id(true);
    $_SESSION['safety'] = true;
}
$_SESSION['sessionid'] = session_id();

$serveraddress = "localhost"; // Your mysql server address
$serveruser = "root"; // Your mysql user
$serverpass = "DzYdj6dGaz87pVd9"; //Your mysql password

$server_db = "tc434_web"; //Your website database
$server_adb = "tc434_auth"; //Your account database
$server_cdb = "tc434_characters"; //Your characters database
$server_wdb = "tc434_world"; //Your world database

$website['title'] = "TrinityCore 4.3.4 CMS";
$website['address'] = "http://bender/"; // 'http://url/foldername/' or 'http://url/'
$website['root'] = "/"; // '/' <- for root and '/foldername/' <- for any folder
//Initialize Lang Files
include("lang/eng.php");

$connection_setup = mysql_connect($serveraddress,$serveruser,$serverpass)or die(mysql_error());
mysql_select_db($server_db,$connection_setup)or die(mysql_error());

if(isset($_SESSION['username'])){
	mysql_select_db($server_adb,$connection_setup)or die(mysql_error());
	$username = mysql_real_escape_string($_SESSION['username']);
	$lbrspa = mysql_query("SELECT * FROM account WHERE username = '".$username."'");
	$account_information = mysql_fetch_assoc($lbrspa);
	mysql_select_db($server_db,$connection_setup)or die(mysql_error());
}