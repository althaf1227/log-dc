<?php

namespace App\Libraries;

class MyAdminLib
{
    /**
     * --------------------------------------------------------------------------
     * MyAdmin Package
     * Middleware Shield Custom
     * --------------------------------------------------------------------------
     *
     * @developer       DiskominfoPatiDevTeam
     * @instansi        Dinas Komunikasi dan Informatika
     * @version         1.2
     */

    public function explodeUrlWithNoAction(string $value)
    {
		$is_double_convert = false;
		$count_segment = 0;
		$url = rtrim($value, '/\\');
		$array_url = explode('/', $url);
		$last_url = end($array_url);
		$segment = $this->_convertAct($last_url);
		if ($segment === "unidentified") {
			$result_segment = $this->_convertAct($array_url[count($array_url) - 2]);
			$count_segment = count($array_url);
			$is_double_convert = true;
		} else {
			$result_segment = $segment;
		}
		if ($result_segment === "create") {
			$count_segment = count($array_url) - 1;
		}
		if ($result_segment === "update") {
			if ($is_double_convert === true) {
				$count_segment = count($array_url) - 2;
			} else { 
				$count_segment = count($array_url) - 1;
			}
		}
		if ($result_segment === "delete") {
			if ($is_double_convert === true) {
				$count_segment = count($array_url) - 2;
			} else { 
				$count_segment = count($array_url) - 1;
			}
		}
		$url_merge = '';
		for ($i = 0;$i < $count_segment;$i++) {
			$url_merge .= $array_url[$i];
			if ($i < ($count_segment - 1)) {
				$url_merge .= '/';
			}
		}
		$result = $url_merge;
		return $result;
    }

    public function explodeUrlOnlyAction(string $value)
    {
		$url = rtrim($value, '/\\');
		$array_url = explode('/', $url);
		$last_url = end($array_url);

		$segment = $this->_convertAct($last_url);
		if ($segment === "unidentified") {
			$result = $this->_convertAct($array_url[count($array_url) - 2]);
			if ($result === "update" || $result === "delete") {

			} else {
				$result = $this->_convertAct("index");
			}
		} else {
			$result = $segment;
		}
		return $result;
    }

    private function _convertAct(string $value) 
    {
		switch ($value) {
			case "add":
				$result = "create";
				break;
			case "index":
				$result = "read";
				break;
			case "edit":
				$result = "update";
				break;
			case "delete":
				$result = "delete";
				break;
			default:
				$result = "unidentified";
		}
		return $result;
    }
}