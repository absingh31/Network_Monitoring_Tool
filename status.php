<?php
$interface="eth0";
$type=@$_REQUEST['t'];
if( $type!=="down" && $type!=="total-down" && $type!=="total-up" ) $type="up";
$format=@$_REQUEST['f'];
if( $format !== "HUMAN" && $format!=="GB" && $format!=="MB" && $format!=="KB" ) $format="B";
echo exec("./status.sh $type $interface $format");
?>
