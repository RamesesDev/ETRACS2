/*
 * CaptureBPPaymentInitPage.java
 *
 * Created on June 29, 2011, 3:07 PM
 */

package etracs2.bp.ledger;

/**
 *
 * @author  user
 */
public class CaptureBPPaymentInitPage extends javax.swing.JPanel {
    
    /** Creates new form CaptureBPPaymentInitPage */
    public CaptureBPPaymentInitPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jPanel1 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xNumberField1 = new com.rameses.rcp.control.XNumberField();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(452, 187));
        xActionBar1.setName("formActions");
        add(xActionBar1, java.awt.BorderLayout.NORTH);

        jPanel1.setLayout(null);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Payment Initial Information");
        formPanel1.setBorder(xTitledBorder1);
        xTextField1.setCaption("Reference No.");
        xTextField1.setCaptionWidth(100);
        xTextField1.setName("entity.refno");
        xTextField1.setPreferredSize(new java.awt.Dimension(200, 19));
        xTextField1.setRequired(true);
        formPanel1.add(xTextField1);

        xDateField1.setCaption("Reference Date");
        xDateField1.setCaptionWidth(100);
        xDateField1.setName("entity.refdate");
        xDateField1.setPreferredSize(new java.awt.Dimension(100, 19));
        xDateField1.setRequired(true);
        formPanel1.add(xDateField1);

        xNumberField1.setCaption("Amount Paid");
        xNumberField1.setCaptionWidth(100);
        xNumberField1.setName("entity.amtpaid");
        xNumberField1.setPreferredSize(new java.awt.Dimension(150, 19));
        xNumberField1.setRequired(true);
        formPanel1.add(xNumberField1);

        jPanel1.add(formPanel1);
        formPanel1.setBounds(10, 10, 430, 140);

        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JPanel jPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XTextField xTextField1;
    // End of variables declaration//GEN-END:variables
    
}
