package etracs2.groovy

import java.text.DecimalFormat;

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
        
        if( ! value ) {
            throw new Exception(caption + ' is required.')
        }
    }
    
    public static String numberFormat( value, pattern ) {
        if (!value ) value = 0.0
        return (new DecimalFormat( pattern ). format(value) )
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
    
}