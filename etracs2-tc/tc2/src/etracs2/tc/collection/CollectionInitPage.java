/*
 * CollectionInitPage.java
 *
 * Created on April 19, 2011, 4:07 PM
 */

package etracs2.tc.collection;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamora
 */
@StyleSheet("etracs2/tc/collection/CollectionInitPage.style")
public class CollectionInitPage extends javax.swing.JPanel {
    
    /** Creates new form CollectionInitPage */
    public CollectionInitPage() {
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
        xComboBox3 = new com.rameses.rcp.control.XComboBox();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xButton1 = new com.rameses.rcp.control.XButton();

        setPreferredSize(new java.awt.Dimension(771, 489));

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Initial Collection Information");
        formPanel1.setBorder(xTitledBorder1);
        xComboBox3.setCaption("AF No.");
        xComboBox3.setCaptionWidth(100);
        xComboBox3.setExpression("#{objid}");
        xComboBox3.setFont(new java.awt.Font("Arial", 1, 12));
        xComboBox3.setImmediate(true);
        xComboBox3.setIndex(-20);
        xComboBox3.setItems("afList");
        xComboBox3.setName("af");
        xComboBox3.setPreferredSize(new java.awt.Dimension(80, 22));
        xComboBox3.setRequired(true);
        formPanel1.add(xComboBox3);

        xComboBox2.setCaption("Collection Type");
        xComboBox2.setCaptionWidth(100);
        xComboBox2.setDepends(new String[] {"af"});
        xComboBox2.setDynamic(true);
        xComboBox2.setExpression("#{name}");
        xComboBox2.setFont(new java.awt.Font("Arial", 1, 12));
        xComboBox2.setImmediate(true);
        xComboBox2.setItems("collectionTypeList");
        xComboBox2.setName("collectiontype");
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox2.setRequired(true);
        formPanel1.add(xComboBox2);

        xDateField1.setCaption("Txn Date ");
        xDateField1.setCaptionWidth(100);
        xDateField1.setInputFormat("MM-dd-yyyy");
        xDateField1.setName("entity.info.txndate");
        xDateField1.setOutputFormat("MM-dd-yyyy");
        xDateField1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xDateField1);

        xLabel4.setForeground(new java.awt.Color(204, 0, 0));
        xLabel4.setFont(new java.awt.Font("Arial", 1, 18));
        xLabel4.setName("txnmode");

        xButton1.setMnemonic('n');
        xButton1.setText("Next");
        xButton1.setDefaultCommand(true);
        xButton1.setName("doNext");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(xLabel4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 558, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                        .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 345, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(203, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(xLabel4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 24, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 128, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(291, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XComboBox xComboBox3;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XLabel xLabel4;
    // End of variables declaration//GEN-END:variables
    
}