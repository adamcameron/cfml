<?php

$DEPS = array(
	'line' 		=> array('xy'),
	'line3d' 	=> array('3d','line'),
	'area' 		=> array('xy'),
	'area3d' 	=> array('3d','area'),
	'vbar' 		=> array('xy'),
	'vbar3d' 	=> array('3d','vbar'),
	'hbar' 		=> array('yx'),
	'hbar3d' 	=> array('3d','hbar'),
	'scatter' 	=> array('xy'),
	'bubble' 	=> array('xy'),
	'pie' 		=> array('r'),
	'pie3d' 	=> array('3d','pie'),
	'nestedpie' => array('r'),
	'gauge' 	=> array('r'),
	'vbullet' 	=> array('vbar'),
	'hbullet' 	=> array('hbar'),
	'vfunnel' 	=> array('xy'),
	'hfunnel' 	=> array('yx'),
	'piano' 	=> array('xy'),
	'radar' 	=> array('r'),
	'range' 	=> array('xy'),
	'stock' 	=> array('xy','vbar'),
	'venn' 		=> array('r')
);

function setupDEPS($aModules) {
	global $DEPS;
	$aModules_ = array();
	for ($i=0;$i<count($aModules);$i++) {
		if (isset($DEPS[$aModules[$i]])) {
			$aModules_ = array_merge($aModules_, setupDEPS($DEPS[$aModules[$i]]));
		}
		array_push($aModules_, $aModules[$i]);
	}
	return $aModules_;
}

$sBuild = '';

//include core
$sBuild .= file_get_contents('html5_scripts/modules/zingchart-html5-core-min.js');

if (isset($_FILES) && isset($_FILES['filconfig'])) {

	$sConfig = file_get_contents($_FILES['filconfig']['tmp_name']);
	$oConfig = json_decode($sConfig);
	$aModules = $oConfig->modules;

} else {

	$aModules = array();
	foreach ($_POST as $k => $v) {
		$k = substr($k, 3);
		array_push($aModules, $k);
	}
	$aModules = array_unique(setupDEPS($aModules));
}

$sConfig = '{"modules":[';
for ($i=0;$i<count($aModules);$i++) {
	$aModules[$i] = trim($aModules[$i]);
	if (file_exists('html5_scripts/modules/zingchart-html5-' . $aModules[$i] . '-min.js')) {
		$sConfig .= '"' . $aModules[$i] . '",';
		$sModule = file_get_contents('html5_scripts/modules/zingchart-html5-' . $aModules[$i] . '-min.js');
		//remove the copy comments (already in core)
		$p = strpos($sModule, '*/');
		if ($p !== false) {
			$sModule = substr($sModule, $p + 2);
		}
		$sBuild .= $sModule;
	}
}
if (count($aModules) > 0) {
	$sConfig = substr($sConfig, 0, -1);
}
$sConfig .= ']}';

$sFileName = date('YmdHis') . rand(100000,999999) . 'zingchart-html5-min.js.zip';

if (1) {
	$sDirName = '../build_generator_vault/' . date('YmdHis') . rand(100000,999999) . 'd';
	mkdir($sDirName);
	file_put_contents($sDirName . '/zingchart-html5-min.js', $sBuild);
	file_put_contents($sDirName . '/zingchart-html5.cnf', $sConfig);
	exec('cd ' . $sDirName . ';zip ../' . $sFileName . ' ' . 'zingchart-html5-min.js zingchart-html5.cnf');
	unlink($sDirName . '/zingchart-html5-min.js');
	unlink($sDirName . '/zingchart-html5.cnf');
	rmdir($sDirName);
} else {
	$oZip = new ZipArchive();
	if ($oZip->open('../build_generator_vault/' . $sFileName, ZIPARCHIVE::CREATE) !== TRUE) {
	    die();
	}
	$oZip->addFromString('zingchart-html5-min.js', $sBuild);
	$oZip->addFromString('zingchart-html5.cnf', $sConfig);
	$oZip->close();
}

header("Content-Type: application/octet-stream");
header("Content-Disposition: attachment; filename='" . substr($sFileName, 20) . "'");
header('Pragma: cache');
header('Cache-Control: public, must-revalidate, max-age=0');
header('Connection: close');
header('Expires: ' . date('r', time()+60*60));
header('Last-Modified: ' . date('r', time()));

echo file_get_contents('../build_generator_vault/' . $sFileName);

unlink('../build_generator_vault/' . $sFileName);

?>