<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<?php 
$card_id_json = get_data('http://www.mtgstocks.com/cards/autocomplete_card_name?term='.$_GET["card"]);
$id = json_decode($card_id_json, TRUE)[0]["id"];
//$id = 28139;
echo "<script>";
echo "function chartMobile () {\n";
echo "$('#container').highcharts('StockChart', ";
/* gets the data from a URL */
function get_data($url) {
	$ch = curl_init();
	$timeout = 5;
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
	$data = curl_exec($ch);
	curl_close($ch);
	return $data;
}

//$result = get_data('http://www.mtggoldfish.com/price/Modern+Masters+2015/Tarmogoyf'); 
$result = get_data('http://www.mtgstocks.com/cards/'.$id);//28139
# Create a DOM parser object
$dom = new DOMDocument();
$dom->validateOnParse = true;
# Parse the HTML from Google.
# The @ before the method call suppresses any warnings that
# loadHTML might throw because of invalid HTML in the page.
@$dom->loadHTML($result);

//echo var_dump($dom->getElementById('graphdiv-paper'));

$xpath = new DOMXPath($dom);
$tags = $xpath->query('//*[@id="financial"]/div[1]/div[1]/script/text()');
foreach ($tags as $tag) {
    $thing = substr($tag->textContent,188, -229);
    echo $thing; //[127:-186]
}

echo ")};</script>";
?>

<div id="container" style="height: 400px; min-width: 310px"></div>
