/*
 * DailyInitPage.java
 *
 * Created on June 3, 2011, 2:11 PM
 */

package etracs2.tc.report.abstractofcollection;

/**
 *
 * @author  user
 */
public class DailyInitPage extends javax.swing.JPanel {
    
    /**
     * Creates new form DailyInitPage
     */
    public DailyInitPage() {
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
        xDateField1 = new com.rameses.rcp.control.XDateField();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(400, 251));
        xActionBar1.setName("formActions");
        add(xActionBar1, java.awt.BorderLayout.NORTH);

        jPanel1.setLayout(null);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Abstract of Collection Daily Report");
        formPanel1.setBorder(xTitledBorder1);
        xDateField1.setCaption("Collection Date");
        xDateField1.setCaptionWidth(100);
        xDateField1.setName("collectiondate");
        xDateField1.setPreferredSize(new java.awt.Dimension(100, 19));
        formPanel1.add(xDateField1);

        jPanel1.add(formPanel1);
        formPanel1.setBounds(10, 10, 380, 200);

        add(jPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JPanel jPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XDateField xDateField1;
    // End of variables declaration//GEN-END:variables
    
}
