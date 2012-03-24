package etracs2.groovy

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

class CommonUtil 
{
    private CommonUtil() {}
    
    public static def sum( list, closure ) {
        def total = list.sum( closure )
        if( total ) return total
        return 0.0
    }

    public static def sum(list ) {
        if( ! list ) return 0.0
        return sum( list, {it} )
    }
    
    public static void required(caption, value) {
        if( ! value || value.toString().trim().length() == 0 ) {
            throw new Exception(caption + ' is required.')
        }
    }
    
    public static String formatNumber( pattern, value ) {
        if (!value ) value = 0.0
        return (new DecimalFormat( pattern ).format(value) )
    }
    
    public static String formatDate( pattern, value ) {
        if (!value ) return ''
        if( ! value instanceof Date ) return value
        return (new SimpleDateFormat( pattern ).format(value) )
    }
    
    
    public static def getMonth( def monthid ) {
        if( monthid < 0 || monthid > 12) throw new Exception('Month ID ' + monthid + ' is invalid.')
        return getMonthList().find{ a -> a.monthid == monthid }
    }
    
    public static def getMonthList() {
        return [
            [monthid : 1, monthcode : 'JAN', monthname: 'JANUARY', ],
            [monthid : 2, monthcode : 'FEB', monthname: 'FEBRUARY', ],
            [monthid : 3, monthcode : 'MAR', monthname: 'MARCH', ],
            [monthid : 4, monthcode : 'APR', monthname: 'APRIL', ],
            [monthid : 5, monthcode : 'MAY', monthname: 'MAY', ],
            [monthid : 6, monthcode : 'JUN', monthname: 'JUNE', ],
            [monthid : 7, monthcode : 'JUL', monthname: 'JULY', ],
            [monthid : 8, monthcode : 'AUG', monthname: 'AUGUST', ],
            [monthid : 9, monthcode : 'SEP', monthname: 'SEPTEMBER', ],
            [monthid : 10, monthcode : 'OCT', monthname: 'OCTOBER', ],
            [monthid : 11, monthcode : 'NOV', monthname: 'NOVEMBER', ],
            [monthid : 12, monthcode : 'DEC', monthname: 'DECEMBER', ],
        ]
    }
    
    
    private static final def majorNames = [
        "",
        " thousand",
        " million",
        " billion",
        " trillion",
        " quadrillion",
        " quintillion"
    ];
    
    private static final def tensNames = [
        "",
        " ten",
        " twenty",
        " thirty",
        " forty",
        " fifty",
        " sixty",
        " seventy",
        " eighty",
        " ninety"
    ];
    
    private static final def numNames = [
        "",
        " one",
        " two",
        " three",
        " four",
        " five",
        " six",
        " seven",
        " eight",
        " nine",
        " ten",
        " eleven",
        " twelve",
        " thirteen",
        " fourteen",
        " fifteen",
        " sixteen",
        " seventeen",
        " eighteen",
        " nineteen"
    ];
    
    
    
    private static String convertLessThanOneThousand(int number) {
        String soFar;
        
        if (number % 100 < 20){
            soFar = numNames[number % 100];
            number /= 100;
        } else {
            soFar = numNames[number % 10];
            number /= 10;
            
            soFar = tensNames[number % 10] + soFar;
            number /= 10;
        }
        if (number == 0) return soFar;
        return numNames[number] + " hundred" + soFar;
    }
    
    public static String convert(long number) {
        /* special case */
        if (number == 0) { return "zero"; }
        
        String prefix = "";
        
        if (number < 0) {
            number = -number;
            prefix = "negative";
        }
        
        String soFar = "";
        int place = 0;
        
        while (number > 0) {
            long n = number % 1000;
            if (n != 0) {
                String s = convertLessThanOneThousand((int)n);
                soFar = s + majorNames[place] + soFar;
            }
            place++;
            number /= 1000;
        }
        
        return (prefix + soFar).trim();
        
    }
    
    public static String wordFromNumber( BigDecimal number) {
            return wordFromNumber( number.doubleValue() )
    }

    public static String wordFromNumber( double number) {
        String str 		= formatNumber( '############0.00', number);
		println '*'*50
		println 'str -> ' + str
        String strDec	= "";
        String wn 		= convert((long)number);
        
        if (str.indexOf(".") >= 0) {
            strDec = str.replaceAll( ((long)number) + ".","");
            
            if ( Long.parseLong(strDec) > 0)
                strDec = " AND " + getCents(strDec) + "/100";
            else
                strDec = "";
        }
        
        return wn + strDec;
    }
    
   
    public static String getCents(String cents) {
        cents = formatNumber('0.00',Double.valueOf("." + cents));
        return cents.substring(cents.indexOf(".")+1);
    }
    
}