package br.com.facdombosco.gesturehealthcare.model.util
{
	import mx.formatters.DateFormatter;

	public class DateUtil
	{
		public static function format(date : Date, format : String = "DD/MM/YYYY HH:NN:SS") : String
		{
			var dateFormatter : DateFormatter = new DateFormatter();
			dateFormatter.formatString = format;
			return dateFormatter.format(date).replace("24:", "00:");
		}
	}
}