<?php
/*
for ci4
Parameter	Description
format	Required. Specifies the format of the outputted date string. The following characters can be used:
d - The day of the month (from 01 to 31)
D - A textual representation of a day (three letters)
j - The day of the month without leading zeros (1 to 31)
l (lowercase 'L') - A full textual representation of a day
N - The ISO-8601 numeric representation of a day (1 for Monday, 7 for Sunday)
S - The English ordinal suffix for the day of the month (2 characters st, nd, rd or th. Works well with j)
w - A numeric representation of the day (0 for Sunday, 6 for Saturday)
z - The day of the year (from 0 through 365)
W - The ISO-8601 week number of year (weeks starting on Monday)
F - A full textual representation of a month (January through December)
m - A numeric representation of a month (from 01 to 12)
M - A short textual representation of a month (three letters)
n - A numeric representation of a month, without leading zeros (1 to 12)
t - The number of days in the given month
L - Whether it's a leap year (1 if it is a leap year, 0 otherwise)
o - The ISO-8601 year number
Y - A four digit representation of a year
y - A two digit representation of a year
a - Lowercase am or pm
A - Uppercase AM or PM
B - Swatch Internet time (000 to 999)
g - 12-hour format of an hour (1 to 12)
G - 24-hour format of an hour (0 to 23)
h - 12-hour format of an hour (01 to 12)
H - 24-hour format of an hour (00 to 23)
i - Minutes with leading zeros (00 to 59)
s - Seconds, with leading zeros (00 to 59)
u - Microseconds (added in PHP 5.2.2)
e - The timezone identifier (Examples: UTC, GMT, Atlantic/Azores)
I (capital i) - Whether the date is in daylights savings time (1 if Daylight Savings Time, 0 otherwise)
O - Difference to Greenwich time (GMT) in hours (Example: +0100)
P - Difference to Greenwich time (GMT) in hours:minutes (added in PHP 5.1.3)
T - Timezone abbreviations (Examples: EST, MDT)
Z - Timezone offset in seconds. The offset for timezones west of UTC is negative (-43200 to 50400)
c - The ISO-8601 date (e.g. 2013-05-05T16:34:42+00:00)
r - The RFC 2822 formatted date (e.g. Fri, 12 Apr 2013 12:01:05 +0200)
U - The seconds since the Unix Epoch (January 1 1970 00:00:00 GMT)
and the following predefined constants can also be used (available since PHP 5.1.0):

DATE_ATOM - Atom (example: 2013-04-12T15:52:01+00:00)
DATE_COOKIE - HTTP Cookies (example: Friday, 12-Apr-13 15:52:01 UTC)
DATE_ISO8601 - ISO-8601 (example: 2013-04-12T15:52:01+0000)
DATE_RFC822 - RFC 822 (example: Fri, 12 Apr 13 15:52:01 +0000)
DATE_RFC850 - RFC 850 (example: Friday, 12-Apr-13 15:52:01 UTC)
DATE_RFC1036 - RFC 1036 (example: Fri, 12 Apr 13 15:52:01 +0000)
DATE_RFC1123 - RFC 1123 (example: Fri, 12 Apr 2013 15:52:01 +0000)
DATE_RFC2822 - RFC 2822 (Fri, 12 Apr 2013 15:52:01 +0000)
DATE_RFC3339 - Same as DATE_ATOM (since PHP 5.1.3)
DATE_RSS - RSS (Fri, 12 Aug 2013 15:52:01 +0000)
DATE_W3C - World Wide Web Consortium (example: 2013-04-12T15:52:01+00:00)
timestamp	Optional. Specifies an integer Unix timestamp. Default is the current local time (time())

*/

// untuk mengetahui bulan bulan
if (!function_exists('func_UbahkeNamaBulan')) {
    function func_UbahkeNamaBulan($bln) {
        switch ($bln)
        {
            case 1:
                return "Januari";
                break;
            case 2:
                return "Februari";
                break;
            case 3:
                return "Maret";
                break;
            case 4:
                return "April";
                break;
            case 5:
                return "Mei";
                break;
            case 6:
                return "Juni";
                break;
            case 7:
                return "Juli";
                break;
            case 8:
                return "Agustus";
                break;
            case 9:
                return "September";
                break;
            case 10:
                return "Oktober";
                break;
            case 11:
                return "November";
                break;
            case 12:
                return "Desember";
                break;
        }
    }
}

if (!function_exists('func_UbahkeNamahari')) {
    function func_UbahkeNamahari($hari) {
		switch($hari) {
			case "Sunday":
				return "Ahad";
				break;
			case "Monday":
				return "Senin";
				break;
			case "Tuesday":
				return "Selasa";
				break;
			case "Wednesday":
				return "Rabu";
				break;
			case "Thursday":
				return "Kamis";
				break;
			case "Friday":
				return "Jumat";
				break;
			case "Saturday":
				return "Sabtu";
				break;
		}
    }
}

// mengganti T F to YA TIDAK
if (!function_exists('func_ExplainTF')) {
    function func_ExplainTF($param) {
		if ($param == "T") return "YA";
		if ($param == "F") return "TIDAK";
	}
}

if (!function_exists('func_AngkaToTomawi')) {
	function func_AngkaToTomawi($angka) {
		$angka = intval($angka);
		$result = '';
		$array = array(
			'M' => 1000,
			'CM' => 900,
			'D' => 500,
			'CD' => 400,
			'C' => 100,
			'XC' => 90,
			'L' => 50,
			'XL' => 40,
			'X' => 10,
			'IX' => 9,
			'V' => 5,
			'IV' => 4,
			'I' => 1
		);
		foreach($array as $roman => $value) {
			$matches = intval($angka / $value);
			$result .= str_repeat($roman ,$matches);
			$angka = $angka % $value;
		}
		return $result;
	}
}

// // fungsi konversi Ukuran File (byte)
// if (!function_exists('konversiukuranfile')) {
//     function konversiukuranfile($bytes) {
//         if ($bytes >= 1073741824) {
//             $bytes = number_format($bytes / 1073741824, 2) . ' GB';
//         } elseif ($bytes >= 1048576) {
//             $bytes = number_format($bytes / 1048576, 2) . ' MB';
//         } elseif ($bytes >= 1024) {
//             $bytes = number_format($bytes / 1024, 2) . ' KB';
//         } elseif ($bytes > 1) {
//             $bytes = $bytes . ' bytes';
//         } elseif ($bytes == 1) {
//             $bytes = $bytes . ' byte';
//         } else {
//             $bytes = '0 bytes';
//         }
//         return $bytes;
// 	}
// }

// // fungsi ambil tanggal awal tanggal akhir dari angka minggu
// // 33,2021 -> array(2) { ["week_start"]=> string(10) "2021-08-16" ["week_end"]=> string(10) "2021-08-22" }
// if (!function_exists('func_getStartAndEndDate')) {
// 	function func_getStartAndEndDate($week, $year) {
// 		$dto = new DateTime();
// 		$dto->setISODate($year, $week);
// 		$ret['week_start'] = $dto->format('Y-m-d');
// 		$dto->modify('+6 days');
// 		$ret['week_end'] = $dto->format('Y-m-d');
// 		return $ret;
// 	}
// }

// dd-mm-yyyy -> yyyy-mm-dd | yyyy-mm-dd -> dd-mm-yyyy
if (!function_exists('func_UbahTanggalBasic')) {
	function func_UbahTanggalBasic($tgl = null) {
		if (is_null($tgl)) return false;
		$pecah = explode('-', $tgl);
		$hasil = $pecah[2].'-'.$pecah[1].'-'.$pecah[0];
		return $hasil;
	}
}

// //12/21/2016 - 12/21/2016 -> 2016-12-21 00:00:01
// if (!function_exists('ubahformattglrange')) {
// 	function ubahformattglrange($tgl, $pos) {
// 		$pecah = explode(' - ', $tgl);
// 		if ($pos == "buka") {
// 			$tglpecah = $pecah[0];
// 			$pecahtglnew = explode('/',$tglpecah);
// 			$hasil = $pecahtglnew[2].'-'.$pecahtglnew[0].'-'.$pecahtglnew[1].' 00:00:01';
// 		} else if ($pos=="tutup") {
// 			$tglpecah = $pecah[1];
// 			$pecahtglnew = explode('/',$tglpecah);
// 			$hasil = $pecahtglnew[2].'-'.$pecahtglnew[0].'-'.$pecahtglnew[1].' 23:59:59';
// 		}
// 		return $hasil;
// 	}
// }

// // example: 2016-12-22 00:00:01 -> 12/22/2016 - 12/23/2016
// if (!function_exists('resettglrange')) {
// 	function resettglrange($tgl) {
// 		$pecah = explode(' ',$tgl);
// 		$tglawal = $pecah[0];
// 		$pecahtglawal = explode('-',$tglawal);
// 		$newtglawal = $pecahtglawal[1].'/'.$pecahtglawal[2].'/'.$pecahtglawal[0];
// 		$tglakhir = $pecah[2];
// 		$pecahtglakhir = explode('-',$tglakhir);
// 		$newtglakhir = $pecahtglakhir[1].'/'.$pecahtglakhir[2].'/'.$pecahtglakhir[0];
// 		$hasil = $newtglawal.' - '.$newtglakhir;
// 		return $hasil;
// 	}
// }

// //1-999999999
// if (!function_exists('ubahterbilang')) {
// 	function ubahterbilang($rp) {
// 		$hasil = "";
// 		$arr_number = array("","satu","dua","tiga","empat","lima","enam","tujuh","delapan","sembilan","sepuluh","sebelas");
// 		if ($rp < 12) {
// 			$hasil = " ".$arr_number[$rp];
// 		} else if ($rp < 20) {
// 			$hasil = ubahterbilang($rp-10)." belas";
// 		} else if ($rp < 100) {
// 			$hasil = ubahterbilang($rp/10)." puluh ".ubahterbilang($rp%10);
// 		} else if ($rp < 200) {
// 			$hasil = "seratus ".ubahterbilang($rp-100);
// 		} else if ($rp < 1000) {
// 			$hasil = ubahterbilang($rp/100)." ratus ".ubahterbilang($rp%100);
// 		} else if ($rp < 2000) {
// 			$hasil = "seribu ".ubahterbilang($rp-1000);
// 		} else if ($rp < 1000000) {	
// 			$hasil = ubahterbilang($rp/1000)." ribu ".ubahterbilang($rp%1000);
// 		} else if ($rp < 1000000000) {
// 			$hasil = ubahterbilang($rp/1000000)." juta ".ubahterbilang($rp%1000000);
// 		} else {
// 			$hasil = 'melebihi batas';
// 		}
// 		return $hasil;
// 	}
// }

// // mm/dd/yyyy -> yyyy-mm-dd , example: 12/29/2016 -> 2016-12-29
// if (!function_exists('fungsi_ubahtanggal1')) {
// 	function fungsi_ubahtanggal1($tgl) {
// 		$pecah = explode('/',$tgl);
// 		$hasil = $pecah[2].'-'.$pecah[0].'-'.$pecah[1];
// 		return $hasil;
// 	}
// }

// yyyy-mm-dd hh:ii:ss -> day, dd month yyyy , example: 2016-12-29 00:00:00 -> Senin, 29 Desember 2016
if (!function_exists('func_UbahTanggal4')) {
	function func_UbahTanggal4($tgl) {
		$tglBaru = explode(" ",$tgl);
		$tglBaru1 = $tglBaru[0]; //mendapatkan variabel format yyyy-mm-dd
		$tglBaru2 = $tglBaru[1]; //mendapatkan fotmat hh:ii:ss
		$tglBarua = explode("-",$tglBaru1); //lalu memecah variabel berdasarkan -
		$tgl = $tglBarua[2];
		$bln = $tglBarua[1];
		$thn = $tglBarua[0];
		$nama = date("l", mktime(0,0,0,$bln,$tgl,$thn));
		$nama_hari = func_UbahkeNamahari($nama);
		$bln = func_UbahkeNamaBulan($bln); //mengganti bulan angka menjadi text dari fungsi bulan
		$ubahTanggal = "$nama_hari, $tgl $bln $thn"; //hasil akhir tanggal
		return $ubahTanggal;
	}
}

// // yyyy-mm-dd hh:ii:ss -> mm/dd/yyyy , example: 2016-12-22 00:00:01 -> 12/22/2016
// if(!function_exists('fungsi_ubahtanggal3')) {
// 	function fungsi_ubahtanggal3($tgl) {
// 		$pecah = explode(' ',$tgl);
// 		$tglawal = $pecah[0];
// 		$pecahtglawal = explode('-',$tglawal);
// 		$newtglawal = $pecahtglawal[1].'/'.$pecahtglawal[2].'/'.$pecahtglawal[0];
// 		$hasil = $newtglawal;
// 		return $hasil;
// 	}
// }

// yyyy-mm-dd hh:ii:ss -> day, dd month yyyy pukul hh:ii:ss , example: 2020-02-19 00:00:00 -> Rabu, 19 Februari 2020 Pukul 07:00:00
if (!function_exists('func_UbahTanggal4')) {
	function func_UbahTanggal4($tgl) {
		$tglBaru = explode(" ", $tgl);
		$tglBaru1 = $tglBaru[0];
		$tglBaru2 = $tglBaru[1];
		$tglBarua = explode("-", $tglBaru1);
		$tgl = $tglBarua[2];
		$bln =$tglBarua[1];
		$thn = $tglBarua[0];
		$nama = date("l", mktime(0, 0, 0, $bln, $tgl, $thn));
		$nama_hari = func_UbahkeNamahari($nama);
        $jambaru = explode(":", $tglBaru2);
        $jam = $jambaru[0];
        $menit = $jambaru[1];
        $detik = $jambaru[2];
		$bln = func_UbahkeNamaBulan($bln);
		$ubahTanggal = "$nama_hari, $tgl $bln $thn pukul $jam:$menit:$detik ";
		return $ubahTanggal;
	}
}

// // mm/dd/yyyy - mm/dd/yyyy -> yyyy-mm-dd , example: 03/15/2020 - 03/31/2020 -> 2020-03-15
// if (!function_exists('fungsi_ubahtanggal5')) {
// 	function fungsi_ubahtanggal5($tgl) {
// 		$tgl = str_replace(" ","",$tgl);
// 		$tglBaru = explode("-",$tgl);
// 		$tglBaru1 = $tglBaru[0];
// 		$tglBarua = explode("/",$tglBaru1);
// 		$tgl = $tglBarua[1];
// 		$bln = $tglBarua[0];
// 		$thn = $tglBarua[2];
// 		$ubahTanggal = $thn."-".$bln."-".$tgl;
// 		return $ubahTanggal;
// 	}
// }

// // mm/dd/yyyy - mm/dd/yyyy -> yyyy-mm-dd , example: 03/15/2020 - 03/31/2020 -> 2020-03-15 / 2020-03-31 
if (!function_exists('func_UbahTanggal6')) {
	function func_UbahTanggal6($tgl, $posisi) {
		if (in_array($posisi, ['awal', 'akhir']) == false) return false;
		$pecah = explode(' - ', $tgl);
		if ($posisi == 'awal') {
			$tglpecah = $pecah[0];
		} else if ($posisi == 'akhir') {
			$tglpecah = $pecah[1];
		} else {
			return false;
		}

		$pecahtglnew = explode('/', $tglpecah);
		$hasil = $pecahtglnew[2].'-'.$pecahtglnew[0].'-'.$pecahtglnew[1];
		return $hasil;
	}
}

// yyyy-mm-dd hh:ii:ss -> dd-mm-yyyy hh:ii:ss , example: 2020-03-23 17:02:00 -> 23-03-2020 17:02:00
if (!function_exists('func_UbahTanggal7')) {
	function func_UbahTanggal7($tgl) {
		$tglBaru = explode(" ", $tgl);
		$tglBaru1 = $tglBaru[0];
		$tglBaru2 = $tglBaru[1];
		$tglBarua = explode("-", $tglBaru1);
		$tgl = $tglBarua[2];
		$bln = $tglBarua[1];
		$thn = $tglBarua[0];
		$result = "$tgl-$bln-$thn $tglBaru2";
		return $result;
	}
}

// yyyy-mm-dd -> mm/dd/yyyy , example: 2020-12-22 -> 12/22/2020
if (!function_exists('func_UbahTanggal8')) {
	function func_UbahTanggal8($tgl) {
		$pecahtgl = explode('-',$tgl);
		$newtglawal = $pecahtgl[1].'/'.$pecahtgl[2].'/'.$pecahtgl[0];
		$hasil = $newtglawal;
		return $hasil;
	}
}

// yyyy-mm-dd -> day, dd month yyyy , example: 2020-04-28 -> Selasa, 28 April 2020
if (!function_exists('func_UbahTanggal9')) {
	function func_UbahTanggal9($tgl) {
		$pecahtgl = explode('-', $tgl);
		$tglBaru = $pecahtgl;
		$tgl = $tglBaru[2];
		$bln = $tglBaru[1];
		$thn = $tglBaru[0];
		$nama = date("l", mktime(0, 0, 0, $bln, $tgl, $thn));
		$nama_hari = func_UbahkeNamahari($nama);
		$bln = func_UbahkeNamaBulan($bln); //mengganti bulan angka menjadi text dari fungsi bulan
		$ubahTanggal = "$nama_hari, $tgl $bln $thn"; //hasil akhir tanggal
		return $ubahTanggal;
	}
}

// // (yyyy-mm-dd,yyyy-mm-dd) -> mm/dd/yyyy - mm/dd/yyyy , example: (2020-12-22,2020-12-23) -> 12/22/2020 - 12/23/2020
// if (!function_exists('fungsi_ubahtanggal10')) {
// 	function fungsi_ubahtanggal10($tgl1,$tgl2) {
// 		$pecahtgl = explode('-',$tgl1);
// 		$newtglawal1 = $pecahtgl[1].'/'.$pecahtgl[2].'/'.$pecahtgl[0];
// 		$pecahtgl = explode('-',$tgl2);
// 		$newtglawal2 = $pecahtgl[1].'/'.$pecahtgl[2].'/'.$pecahtgl[0];
// 		$hasil = $newtglawal1." - ".$newtglawal2;
// 		return $hasil;
// 	}
// }

// yyyy-mm-dd hh:ii:ss -> dd month yyyy hh:ii:ss , example: 2020-12-29 00:00:00 -> 29 Desember 2020 00:00:00
if (!function_exists('func_UbahTanggal11')) {
	function func_UbahTanggal11($tgl) {
		$pecahtgl = explode(' ',$tgl);
		$newtgl = explode("-",$pecahtgl[0]);
		$tgl = $newtgl[2];
		$bln = $newtgl[1];
		$thn = $newtgl[0];
		$bln = func_UbahkeNamaBulan($bln);
		$hasil = "$tgl $bln $thn $pecahtgl[1]";
		return $hasil;
	}
}

// yyyy-mm-dd -> dd month yyyy , example: 2020-04-28 -> 28 April 2020
if (!function_exists('func_UbahTanggal12')) {
	function func_UbahTanggal12($tgl) {
		$pecahtgl = explode('-', $tgl);
		$tglBaru = $pecahtgl;
		$tgl = $tglBaru[2];
		$bln = $tglBaru[1];
		$thn = $tglBaru[0];
		$bln = func_UbahkeNamaBulan($bln); //mengganti bulan angka menjadi text dari fungsi bulan
		$ubahTanggal = "$tgl $bln $thn"; //hasil akhir tanggal
		return $ubahTanggal;
	}
}

// yyyy-mm-dd hh:ii:ss -> dd month yyyy , example: 2020-07-02 00:00:00 -> 02 Juni 2020
if (!function_exists('func_UbahTanggal13')) {
	function func_UbahTanggal13($tgl) {
		$exp = explode(' ',$tgl);
		$pecahtgl = explode('-',$exp[0]);
		$tglBaru = $pecahtgl;
		$tgl = $tglBaru[2];
		$bln = $tglBaru[1];
		$thn = $tglBaru[0];
		$bln = func_UbahkeNamaBulan($bln); //mengganti bulan angka menjadi text dari fungsi bulan
		$ubahTanggal = "$tgl $bln $thn"; //hasil akhir tanggal
		return $ubahTanggal;
	}
}

// // yyyy-mm-dd hh:ii:ss -> dd/mm/yyyy , example: 2020-09-01 00:00:00 -> 01/09/2020
// if (!function_exists('fungsi_ubahtanggal14')) {
// 	function fungsi_ubahtanggal14($tgl) {
// 		$exp = explode(' ',$tgl);
// 		$pecahtgl = explode('-',$exp[0]);
// 		$tglBaru = $pecahtgl;
// 		$tgl = $tglBaru[2];
// 		$bln = $tglBaru[1];
// 		$thn = $tglBaru[0];
// 		$ubahTanggal = "$tgl/$bln/$thn"; //hasil akhir tanggal
// 		return $ubahTanggal;
// 	}
// }

// // yyyy-mm-dd hh:ii:ss -> yyyy/mm/dd , example: 2020-12-02 00:00:00 -> 2020/12/02
// if (!function_exists('fungsi_ubahtanggal15')) {
// 	function fungsi_ubahtanggal15($tgl) {
// 		$exp = explode(' ',$tgl);
// 		$pecahtgl = explode('-',$exp[0]);
// 		$tglBaru = $pecahtgl;
// 		$tgl = $tglBaru[2];
// 		$bln = $tglBaru[1];
// 		$thn = $tglBaru[0];
// 		$ubahTanggal = "$thn/$bln/$tgl"; //hasil akhir tanggal
// 		return $ubahTanggal;
// 	}
// }

// yyyy-mm-dd -> yyyy/mm/dd , example: 2021-05-27 -> 2021/05/27
if (!function_exists('func_UbahTanggal16')) {
	function func_UbahTanggal16($tgl) {
		$pecahtgl = explode('-', $tgl);
		$tglBaru = $pecahtgl;
		$tgl = $tglBaru[2];
		$bln = $tglBaru[1];
		$thn = $tglBaru[0];
		$ubahTanggal = "$thn/$bln/$tgl";
		return $ubahTanggal;
	}
}

// yyyy-mm-dd -> dd/mm/yyyy , example: 2021-08-21 -> 21/08/2020
if (!function_exists('func_UbahTanggal17')) {
	function func_UbahTanggal17($tgl) {
		$pecahtgl = explode('-', $tgl);
		$tglBaru = $pecahtgl;
		$tgl = $tglBaru[2];
		$bln = $tglBaru[1];
		$thn = $tglBaru[0];
		$ubahTanggal = "$tgl/$bln/$thn"; //hasil akhir tanggal
		return $ubahTanggal;
	}
}

// // dd/mm/yyyy -> yyyy-mm-dd , example: 02/11/2021 -> 2021-11-02
// if (!function_exists('fungsi_ubahtanggal18')) {
// 	function fungsi_ubahtanggal18($tgl) {
// 		$pecahtgl = explode('/', $tgl);
// 		$tglBaru = $pecahtgl;
// 		$tgl = $tglBaru[0];
// 		$bln = $tglBaru[1];
// 		$thn = $tglBaru[2];
// 		$ubahTanggal = "$thn-$bln-$tgl"; //hasil akhir tanggal
// 		return $ubahTanggal;
// 	}
// }


if (!function_exists('func_UbahTanggal')) {
	function func_UbahTanggal($date, $format) {
		$datetime = new DateTime($date);
		return $datetime->format($format);;
	}
}

// 10000 - > Rp10.000
if (!function_exists('fungsi_UbahRp')) {
	function fungsi_UbahRp($rp) {
		return 'Rp'.number_format($rp, 0, ',', '.');
	}
}

// 10000 - > Rp10.000,00
if (!function_exists('fungsi_UbahRpDecimal')) {
	function fungsi_UbahRpDecimal($rp) {
		return 'Rp'.number_format($rp, 2, ',', '.');
	}
}

// if (!function_exists('fungsi_waktulalu')) {
// 	function fungsi_waktulalu($timestamp) {
// 		$selisih = time() - strtotime($timestamp) ;
// 		$detik = $selisih;
// 		$menit = round($selisih / 60);
// 		$jam = round($selisih / 3600);
// 		$hari = round($selisih / 86400);
// 		$minggu = round($selisih / 604800);
// 		$bulan = round($selisih / 2419200);
// 		$tahun = round($selisih / 29030400);
// 		if ($detik <= 60) {
// 			$waktu = $detik.' detik yang lalu';
// 		} else if ($menit <= 60) {
// 			$waktu = $menit.' menit yang lalu';
// 		} else if ($jam <= 24) {
// 			$waktu = $jam.' jam yang lalu';
// 		} else if ($hari <= 7) {
// 			$waktu = $hari.' hari yang lalu';
// 		} else if ($minggu <= 4) {
// 			$waktu = $minggu.' minggu yang lalu';
// 		} else if ($bulan <= 12) {
// 			$waktu = $bulan.' bulan yang lalu';
// 		} else {
// 			$waktu = $tahun.' tahun yang lalu';
// 		}
// 		return $waktu;
// 	}
// }

if (!function_exists('func_PisahPemerintahDesa')) {
	function func_PisahPemerintahDesa($string) {
		$desa = explode(" ", $string);
		if (isset($desa[2])) {
			return $desa[2];
		}
		return false;
	}
}

if (!function_exists('func_PisahPemerintahKecamatan')) {
	function func_PisahPemerintahKecamatan($string) {
		$kecamatan = explode(" ", $string);
		if (isset($kecamatan[1])) {
			return $kecamatan[1];
		}
		return false;
	}
}

// 3 => C
if (!function_exists('func_ExportGetConvertNumberToAlpha')){
	function func_ExportGetConvertNumberToAlpha($number){
        $number = intval($number);
        if ($number <= 0) {
            return '';
        }
        $alphabet = '';
        while($number != 0) {
            $p = ($number - 1) % 26;
            $number = intval(($number - $p) / 26);
            $alphabet = chr(65 + $p) . $alphabet;
        }
        return $alphabet;
	}
}

// C => 3
if (!function_exists('func_ExportGetConvertAlphaToNumber')){
	function func_ExportGetConvertAlphaToNumber($alpha){
        $alpha = strtoupper($alpha);
        $length = strlen($alpha);
        $number = 0;
        $level = 1;
        while ($length >= $level ) {
            $char = $alpha[$length - $level];
            $c = ord($char) - 64;        
            $number += $c * (26 ** ($level-1));
           $level++;
        }
       return $number;
	}
}