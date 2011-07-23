/*
 * ApplicationInitialPage.java
 *
 * Created on June 6, 2011, 1:20 PM
 */

package etracs2.bp.application;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  MS
 */
@StyleSheet("etracs2/bp/application/ApplicationMainPage.style")
public class ApplicationMainPage extends javax.swing.JPanel {
    
    /** Creates new form ApplicationInitialPage */
    public ApplicationMainPage() {
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
        jPanel2 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel5 = new com.rameses.rcp.control.XLabel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        jPanel3 = new javax.swing.JPanel();
        formPanel3 = new com.rameses.rcp.util.FormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        formPanel4 = new com.rameses.rcp.util.FormPanel();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xComboBox3 = new com.rameses.rcp.control.XComboBox();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        formPanel5 = new com.rameses.rcp.util.FormPanel();
        xTextField6 = new com.rameses.rcp.control.XTextField();
        xTextField7 = new com.rameses.rcp.control.XTextField();
        xDateField2 = new com.rameses.rcp.control.XDateField();
        xTextField5 = new com.rameses.rcp.control.XTextField();
        formPanel6 = new com.rameses.rcp.util.FormPanel();
        xTextField8 = new com.rameses.rcp.control.XTextField();
        xTextField9 = new com.rameses.rcp.control.XTextField();
        jPanel4 = new javax.swing.JPanel();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(815, 531));
        xActionBar1.setName("formActions");
        add(xActionBar1, java.awt.BorderLayout.NORTH);

        jPanel1.setLayout(null);

        jPanel2.setLayout(null);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle(" Permittee/Owner");
        jPanel2.setBorder(xTitledBorder1);

        com.rameses.rcp.control.border.XLineBorder xLineBorder1 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder1.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel1.setBorder(xLineBorder1);
        xLabel1.setCaption("Permittee");
        xLabel1.setExpression("#{application.info.taxpayername}");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel1.add(xLabel1);

        com.rameses.rcp.control.border.XLineBorder xLineBorder2 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder2.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel2.setBorder(xLineBorder2);
        xLabel2.setCaption("Address");
        xLabel2.setExpression("#{application.info.taxpayeraddress}");
        xLabel2.setName("application.info.taxpayeraddress");
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel1.add(xLabel2);

        jPanel2.add(formPanel1);
        formPanel1.setBounds(0, 20, 350, 50);

        xDateField1.setCaption("Date");
        xDateField1.setCaptionWidth(100);
        xDateField1.setName("application.txndate");
        xDateField1.setPreferredSize(new java.awt.Dimension(0, 19));
        xDateField1.setRequired(true);
        xDateField1.setSize(new java.awt.Dimension(0, 19));
        formPanel2.add(xDateField1);

        com.rameses.rcp.control.border.XLineBorder xLineBorder3 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder3.setLineColor(new java.awt.Color(204, 204, 204));
        xLabel3.setBorder(xLineBorder3);
        xLabel3.setHorizontalAlignment(javax.swing.SwingConstants.TRAILING);
        xLabel3.setCaption("Applicable Year");
        xLabel3.setCaptionWidth(100);
        xLabel3.setExpression("#{application.iyear}");
        xLabel3.setName("application.year");
        xLabel3.setPreferredSize(new java.awt.Dimension(0, 18));
        formPanel2.add(xLabel3);

        jPanel2.add(formPanel2);
        formPanel2.setBounds(350, 20, 240, 50);

        xLabel5.setExpression("<html><font color='red'>#{application.txnmode} #{application.txntype}</font></html>");
        xLabel5.setFont(new java.awt.Font("Tahoma", 1, 12));
        jPanel2.add(xLabel5);
        xLabel5.setBounds(120, 0, 180, 20);

        xLabel4.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        xLabel4.setExpression("<html>APP No.: #{application.txnno}(<font color='blue''>#{application.docstate}</font>)</html>");
        xLabel4.setFont(new java.awt.Font("Tahoma", 1, 12));
        jPanel2.add(xLabel4);
        xLabel4.setBounds(290, 0, 300, 17);

        jPanel1.add(jPanel2);
        jPanel2.setBounds(10, 0, 600, 80);

        jPanel3.setLayout(null);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Business Detail");
        jPanel3.setBorder(xTitledBorder2);

        xTextField1.setCaption("Trade Name");
        xTextField1.setCaptionWidth(85);
        xTextField1.setName("application.info.tradename");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField1.setRequired(true);
        formPanel3.add(xTextField1);

        xTextField2.setCaption("Address");
        xTextField2.setCaptionWidth(85);
        xTextField2.setName("application.info.businessaddress");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField2.setRequired(true);
        formPanel3.add(xTextField2);

        jPanel3.add(formPanel3);
        formPanel3.setBounds(0, 20, 590, 50);

        xComboBox1.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "application.organization" }));
        xComboBox1.setAllowNull(false);
        xComboBox1.setCaption("Organization");
        xComboBox1.setCaptionWidth(85);
        xComboBox1.setItems("organizations");
        xComboBox1.setName("application.info.organization");
        xComboBox1.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox1.setRequired(true);
        formPanel4.add(xComboBox1);

        xComboBox2.setAllowNull(false);
        xComboBox2.setCaption("Office Type");
        xComboBox2.setCaptionWidth(85);
        xComboBox2.setItems("officetypes");
        xComboBox2.setName("application.info.officetype");
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox2.setRequired(true);
        formPanel4.add(xComboBox2);

        xComboBox3.setCaption("Barangay");
        xComboBox3.setCaptionWidth(85);
        xComboBox3.setExpression("#{barangayname}");
        xComboBox3.setItems("barangays");
        xComboBox3.setName("application.info.barangay");
        xComboBox3.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox3.setRequired(true);
        formPanel4.add(xComboBox3);

        xTextField3.setCaption("BIN");
        xTextField3.setCaptionWidth(85);
        xTextField3.setName("application.info.bin");
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel4.add(xTextField3);

        xTextField4.setCaption("PIN");
        xTextField4.setCaptionWidth(85);
        xTextField4.setName("application.info.pin");
        xTextField4.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel4.add(xTextField4);

        jPanel3.add(formPanel4);
        formPanel4.setBounds(0, 70, 340, 120);

        xTextField6.setCaption("CTC No.");
        xTextField6.setName("application.info.ctcno");
        xTextField6.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel5.add(xTextField6);

        xTextField7.setCaption("Place Issued");
        xTextField7.setName("application.info..ctcplaceissued");
        xTextField7.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel5.add(xTextField7);

        xDateField2.setCaption("Date Issued");
        xDateField2.setName("application.info.ctcdateissued");
        xDateField2.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel5.add(xDateField2);

        xTextField5.setCaption("TIN");
        xTextField5.setName("application.info.tin");
        xTextField5.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel5.add(xTextField5);

        jPanel3.add(formPanel5);
        formPanel5.setBounds(350, 70, 240, 120);

        xTextField8.setCaption("Administrator");
        xTextField8.setCaptionWidth(85);
        xTextField8.setName("application.info.administratorname");
        xTextField8.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel6.add(xTextField8);

        xTextField9.setCaption("Address");
        xTextField9.setCaptionWidth(85);
        xTextField9.setName("application.info.administratoraddress");
        xTextField9.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel6.add(xTextField9);

        jPanel3.add(formPanel6);
        formPanel6.setBounds(0, 190, 590, 50);

        jPanel1.add(jPanel3);
        jPanel3.setBounds(10, 80, 600, 250);

        jPanel4.setLayout(null);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setTitle("Line(s) Of Business");
        jPanel4.setBorder(xTitledBorder3);
        xDataTable1.setHandler("lobHandler");
        xDataTable1.setName("lob");
        jPanel4.add(xDataTable1);
        xDataTable1.setBounds(5, 50, 580, 110);

        xActionTextField1.setActionName("getLookupLob");
        xActionTextField1.setCaption("Permittee");
        xActionTextField1.setHint("NAME");
        xActionTextField1.setIndex(-1);
        xActionTextField1.setName("lobSearch");
        xActionTextField1.setPreferredSize(new java.awt.Dimension(0, 19));
        jPanel4.add(xActionTextField1);
        xActionTextField1.setBounds(5, 30, 580, 19);

        jPanel1.add(jPanel4);
        jPanel4.setBounds(10, 330, 600, 170);

        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.util.FormPanel formPanel3;
    private com.rameses.rcp.util.FormPanel formPanel4;
    private com.rameses.rcp.util.FormPanel formPanel5;
    private com.rameses.rcp.util.FormPanel formPanel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XComboBox xComboBox3;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XDateField xDateField2;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel5;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField4;
    private com.rameses.rcp.control.XTextField xTextField5;
    private com.rameses.rcp.control.XTextField xTextField6;
    private com.rameses.rcp.control.XTextField xTextField7;
    private com.rameses.rcp.control.XTextField xTextField8;
    private com.rameses.rcp.control.XTextField xTextField9;
    // End of variables declaration//GEN-END:variables
    
}
