/*
 * MortgageAnnotationPage.java
 *
 * Created on September 4, 2011, 10:07 AM
 */

package etracs2.rpt.faas.annotation;

import com.rameses.rcp.ui.annotations.StyleSheet;
import java.math.BigDecimal;

/**
 *
 * @author  jzamora
 */
@StyleSheet("etracs2/rpt/faas/annotation/MortgageAnnotationPage.style")
public class CancelAnnotationPage extends javax.swing.JPanel {
    
    /** Creates new form MortgageAnnotationPage */
    public CancelAnnotationPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        formPanel3 = new com.rameses.rcp.util.FormPanel();
        formPanel4 = new com.rameses.rcp.util.FormPanel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField5 = new com.rameses.rcp.control.XTextField();
        xDateField3 = new com.rameses.rcp.control.XDateField();
        formPanel5 = new com.rameses.rcp.util.FormPanel();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        xDateField2 = new com.rameses.rcp.control.XDateField();
        xNumberField2 = new com.rameses.rcp.control.XNumberField();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        formPanel6 = new com.rameses.rcp.util.FormPanel();
        formPanel7 = new com.rameses.rcp.util.FormPanel();
        xTextField6 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField7 = new com.rameses.rcp.control.XTextField();
        xTextField8 = new com.rameses.rcp.control.XTextField();
        xDateField4 = new com.rameses.rcp.control.XDateField();
        formPanel8 = new com.rameses.rcp.util.FormPanel();
        xTextField9 = new com.rameses.rcp.control.XTextField();
        xDateField5 = new com.rameses.rcp.control.XDateField();
        xNumberField3 = new com.rameses.rcp.control.XNumberField();
        jScrollPane2 = new javax.swing.JScrollPane();
        xTextArea2 = new com.rameses.rcp.control.XTextArea();
        jScrollPane3 = new javax.swing.JScrollPane();
        xTextArea3 = new com.rameses.rcp.control.XTextArea();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Cancel Annotation Information");
        formPanel1.setBorder(xTitledBorder1);

        formPanel3.setCellpadding(new java.awt.Insets(0, 0, 0, 15));
        formPanel3.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel3.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel3.setPreferredSize(new java.awt.Dimension(0, 110));
        formPanel3.setShowCaption(false);

        formPanel4.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel4.setPreferredSize(new java.awt.Dimension(330, 150));
        formPanel4.setShowCaption(false);
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setCaption("State");
        xLabel2.setCaptionWidth(110);
        xLabel2.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel2.setName("entity.docstate");
        xLabel2.setPreferredSize(new java.awt.Dimension(150, 19));
        formPanel4.add(xLabel2);

        xTextField1.setCaption("File No.");
        xTextField1.setCaptionWidth(110);
        xTextField1.setName("entity.fileno");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField1.setRequired(true);
        formPanel4.add(xTextField1);

        xTextField3.setCaption("Signed By");
        xTextField3.setCaptionWidth(110);
        xTextField3.setName("entity.signedby");
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField3.setRequired(true);
        formPanel4.add(xTextField3);

        xTextField5.setCaption("Job Title");
        xTextField5.setCaptionWidth(110);
        xTextField5.setName("entity.signedbytitle");
        xTextField5.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField5.setRequired(true);
        formPanel4.add(xTextField5);

        xDateField3.setCaption("Date Signed");
        xDateField3.setCaptionWidth(110);
        xDateField3.setName("entity.dtsigned");
        xDateField3.setPreferredSize(new java.awt.Dimension(0, 19));
        xDateField3.setRequired(true);
        formPanel4.add(xDateField3);

        formPanel3.add(formPanel4);

        formPanel5.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel5.setPreferredSize(new java.awt.Dimension(235, 61));
        formPanel5.setShowCaption(false);
        xTextField4.setCaption("O.R. No.");
        xTextField4.setCaptionWidth(95);
        xTextField4.setName("entity.orno");
        xTextField4.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField4.setRequired(true);
        formPanel5.add(xTextField4);

        xDateField2.setCaption("O.R. Date");
        xDateField2.setCaptionWidth(95);
        xDateField2.setName("entity.ordate");
        xDateField2.setPreferredSize(new java.awt.Dimension(0, 19));
        xDateField2.setRequired(true);
        formPanel5.add(xDateField2);

        xNumberField2.setCaption("O.R. Amount");
        xNumberField2.setCaptionWidth(95);
        xNumberField2.setFieldType(BigDecimal.class);
        xNumberField2.setName("entity.oramount");
        xNumberField2.setPattern("#,##0.00");
        xNumberField2.setPreferredSize(new java.awt.Dimension(0, 19));
        xNumberField2.setRequired(true);
        formPanel5.add(xNumberField2);

        formPanel3.add(formPanel5);

        formPanel1.add(formPanel3);

        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 60));
        xTextArea1.setColumns(20);
        xTextArea1.setLineWrap(true);
        xTextArea1.setRows(5);
        xTextArea1.setWrapStyleWord(true);
        xTextArea1.setCaption("Remarks");
        xTextArea1.setCaptionWidth(110);
        xTextArea1.setName("entity.remarks");
        xTextArea1.setPreferredSize(new java.awt.Dimension(0, 60));
        xTextArea1.setTextCase(com.rameses.rcp.constant.TextCase.UPPER);
        jScrollPane1.setViewportView(xTextArea1);

        formPanel1.add(jScrollPane1);

        xActionBar1.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar1.setName("formActions");

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Annotation to Cancel Information");
        formPanel2.setBorder(xTitledBorder2);

        formPanel6.setCellpadding(new java.awt.Insets(0, 0, 0, 15));
        formPanel6.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel6.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel6.setPreferredSize(new java.awt.Dimension(0, 110));
        formPanel6.setShowCaption(false);

        formPanel7.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel7.setPreferredSize(new java.awt.Dimension(330, 150));
        formPanel7.setShowCaption(false);
        xTextField6.setCaption("Annotation Type");
        xTextField6.setCaptionWidth(110);
        xTextField6.setEnabled(false);
        xTextField6.setName("annotation.doctype");
        xTextField6.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel7.add(xTextField6);

        xTextField2.setCaption("File No.");
        xTextField2.setCaptionWidth(110);
        xTextField2.setEnabled(false);
        xTextField2.setName("annotation.fileno");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel7.add(xTextField2);

        xTextField7.setCaption("Signed By");
        xTextField7.setCaptionWidth(110);
        xTextField7.setEnabled(false);
        xTextField7.setName("annotation.signedby");
        xTextField7.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel7.add(xTextField7);

        xTextField8.setCaption("Job Title");
        xTextField8.setCaptionWidth(110);
        xTextField8.setEnabled(false);
        xTextField8.setName("annotation.signedbytitle");
        xTextField8.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel7.add(xTextField8);

        xDateField4.setCaption("Date Signed");
        xDateField4.setCaptionWidth(110);
        xDateField4.setEnabled(false);
        xDateField4.setName("annotation.dtsigned");
        xDateField4.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel7.add(xDateField4);

        formPanel6.add(formPanel7);

        formPanel8.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel8.setPreferredSize(new java.awt.Dimension(235, 61));
        formPanel8.setShowCaption(false);
        xTextField9.setCaption("O.R. No.");
        xTextField9.setCaptionWidth(95);
        xTextField9.setEnabled(false);
        xTextField9.setName("annotation.orno");
        xTextField9.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel8.add(xTextField9);

        xDateField5.setCaption("O.R. Date");
        xDateField5.setCaptionWidth(95);
        xDateField5.setEnabled(false);
        xDateField5.setName("annotation.ordate");
        xDateField5.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel8.add(xDateField5);

        xNumberField3.setCaption("O.R. Amount");
        xNumberField3.setCaptionWidth(95);
        xNumberField3.setEnabled(false);
        xNumberField3.setFieldType(BigDecimal.class);
        xNumberField3.setName("annotation.oramount");
        xNumberField3.setPattern("#,##0.00");
        xNumberField3.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel8.add(xNumberField3);

        formPanel6.add(formPanel8);

        formPanel2.add(formPanel6);

        jScrollPane2.setPreferredSize(new java.awt.Dimension(0, 60));
        xTextArea2.setColumns(20);
        xTextArea2.setLineWrap(true);
        xTextArea2.setRows(5);
        xTextArea2.setWrapStyleWord(true);
        xTextArea2.setCaption("Details");
        xTextArea2.setCaptionWidth(110);
        xTextArea2.setEnabled(false);
        xTextArea2.setName("annotation.details");
        xTextArea2.setPreferredSize(new java.awt.Dimension(0, 60));
        xTextArea2.setTextCase(com.rameses.rcp.constant.TextCase.UPPER);
        jScrollPane2.setViewportView(xTextArea2);

        formPanel2.add(jScrollPane2);

        jScrollPane3.setPreferredSize(new java.awt.Dimension(0, 60));
        xTextArea3.setColumns(20);
        xTextArea3.setLineWrap(true);
        xTextArea3.setRows(5);
        xTextArea3.setWrapStyleWord(true);
        xTextArea3.setCaption("Memoranda");
        xTextArea3.setCaptionWidth(110);
        xTextArea3.setEnabled(false);
        xTextArea3.setName("annotation.memoranda");
        xTextArea3.setPreferredSize(new java.awt.Dimension(0, 60));
        xTextArea3.setTextCase(com.rameses.rcp.constant.TextCase.UPPER);
        jScrollPane3.setViewportView(xTextArea3);

        formPanel2.add(jScrollPane3);

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xActionBar1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 751, Short.MAX_VALUE)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 599, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 599, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(142, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 276, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(48, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.util.FormPanel formPanel3;
    private com.rameses.rcp.util.FormPanel formPanel4;
    private com.rameses.rcp.util.FormPanel formPanel5;
    private com.rameses.rcp.util.FormPanel formPanel6;
    private com.rameses.rcp.util.FormPanel formPanel7;
    private com.rameses.rcp.util.FormPanel formPanel8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XDateField xDateField2;
    private com.rameses.rcp.control.XDateField xDateField3;
    private com.rameses.rcp.control.XDateField xDateField4;
    private com.rameses.rcp.control.XDateField xDateField5;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XNumberField xNumberField2;
    private com.rameses.rcp.control.XNumberField xNumberField3;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    private com.rameses.rcp.control.XTextArea xTextArea2;
    private com.rameses.rcp.control.XTextArea xTextArea3;
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
