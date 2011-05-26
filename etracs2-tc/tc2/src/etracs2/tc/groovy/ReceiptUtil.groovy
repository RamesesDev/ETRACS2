package etracs2.tc.groovy

import com.rameses.util.NumberToWords

static class ReceiptUtil
{
    static void buildReportInfo( entity ) {
        buildItemParticulars( entity )
        buildPayment( entity )
        buildAmountInWords( entity )
    }
        
    static  void buildItemParticulars( entity ) {
        entity.items.each {
            it.particulars = it.accttitle
            if( it.remarks ) {
                it.particulars += ', ' + it.remarks
            }
        }
    }
    
    static void buildPayment( entity ) {
        def checkPayment = entity.payments.find { it.paytype != 'CASH' };
        if( checkPayment ){
            entity.paytype = 'CHECK'
            entity.checkbank = checkPayment.bank
            entity.checkno = checkPayment.checkno
            entity.checkdate = checkPayment.checkdate
            entity.checkamount = checkPayment.amount
        }
        
        def cashPayment = entity.payments.find { it.paytype == 'CASH' }
        if( cashPayment ) {
            entity.paytype = ( entity.paytype == null ? 'CASH' : 'CASH/' + entity.paytype)
        }
    }
    
    static  void buildAmountInWords( entity ) {
        entity.amountinwords =  NumberToWords.instance.convert( entity.info.amount ) + ' PESOS ONLY'
        entity.amountinwords = entity.amountinwords.toUpperCase()
    }    

}        