/*
 * FAASInfoPage.java
 *
 * Created on November 3, 2010, 4:58 PM
 */

package etracs2.prov.transmittal;

/**
 *
 * @author  jzamss
 */
public class TransmittalPage extends javax.swing.JPanel {
    
    /** Creates new form FAASInfoPage */
    public TransmittalPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel7 = new javax.swing.JPanel();
        xLabel5 = new com.rameses.rcp.control.XLabel();
        jPanel3 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        xActionBar2 = new com.rameses.rcp.control.XActionBar();
        jPanel4 = new javax.swing.JPanel();
        jSplitPane1 = new javax.swing.JSplitPane();
        jScrollPane1 = new javax.swing.JScrollPane();
        jPanel5 = new javax.swing.JPanel();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jPanel6 = new javax.swing.JPanel();
        xEditorPane1 = new com.rameses.rcp.control.XEditorPane();
        jPanel1 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xTable1 = new com.rameses.rcp.control.XTable();

        setLayout(new java.awt.BorderLayout());

        jPanel7.setLayout(new java.awt.BorderLayout());

        xLabel5.setBackground(new java.awt.Color(0, 51, 153));
        xLabel5.setBorder(javax.swing.BorderFactory.createEmptyBorder(3, 3, 3, 3));
        xLabel5.setForeground(new java.awt.Color(255, 255, 255));
        xLabel5.setFont(new java.awt.Font("Tahoma", 1, 18));
        xLabel5.setName("title");
        xLabel5.setOpaque(true);
        jPanel7.add(xLabel5, java.awt.BorderLayout.NORTH);

        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel3.setOpaque(false);
        jPanel2.setLayout(new java.awt.BorderLayout());

        xActionBar2.setDepends(new String[] {"selectedItem"});
        xActionBar2.setName("formActions");
        jPanel2.add(xActionBar2, java.awt.BorderLayout.EAST);

        jPanel3.add(jPanel2, java.awt.BorderLayout.WEST);

        jPanel7.add(jPanel3, java.awt.BorderLayout.SOUTH);

        add(jPanel7, java.awt.BorderLayout.NORTH);

        jPanel4.setLayout(new java.awt.BorderLayout());

        jSplitPane1.setDividerLocation(320);
        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setFont(new java.awt.Font("Tahoma", 1, 12));
        xTitledBorder1.setTitle("Quick View");
        xTitledBorder1.setTitlePadding(new java.awt.Insets(2, 5, 2, 5));
        jScrollPane1.setBorder(xTitledBorder1);
        xActionBar1.setDepends(new String[] {"selectedItem"});
        xActionBar1.setName("itemActions");

        xEditorPane1.setDepends(new String[] {"selectedItem"});
        xEditorPane1.setName("html");

        org.jdesktop.layout.GroupLayout jPanel6Layout = new org.jdesktop.layout.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xEditorPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 474, Short.MAX_VALUE)
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, xEditorPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 317, Short.MAX_VALUE)
        );

        org.jdesktop.layout.GroupLayout jPanel5Layout = new org.jdesktop.layout.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xActionBar1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 474, Short.MAX_VALUE)
            .add(jPanel6, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel5Layout.createSequentialGroup()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(322, Short.MAX_VALUE))
            .add(jPanel5Layout.createSequentialGroup()
                .add(26, 26, 26)
                .add(jPanel6, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jScrollPane1.setViewportView(jPanel5);

        jSplitPane1.setRightComponent(jScrollPane1);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setFont(new java.awt.Font("Tahoma", 1, 12));
        xTitledBorder2.setTitle("Transmittal Information");
        xTitledBorder2.setTitlePadding(new java.awt.Insets(2, 5, 2, 5));
        jPanel1.setBorder(xTitledBorder2);

        formPanel1.setCaptionWidth(110);
        formPanel1.setCellspacing(1);
        xLabel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel1.setCaption("Transmittal No.");
        xLabel1.setFont(new java.awt.Font("Tahoma", 1, 11));
        xLabel1.setName("transmittal.docNo");
        xLabel1.setPreferredSize(new java.awt.Dimension(195, 19));
        formPanel1.add(xLabel1);

        xLabel2.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel2.setCaption("LGU Name ");
        xLabel2.setFont(new java.awt.Font("Tahoma", 1, 11));
        xLabel2.setName("transmittal.lgu");
        xLabel2.setPreferredSize(new java.awt.Dimension(195, 19));
        formPanel1.add(xLabel2);

        xLabel4.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel4.setCaption("Transmitted By");
        xLabel4.setFont(new java.awt.Font("Tahoma", 1, 11));
        xLabel4.setName("transmittal.transmittedBy");
        xLabel4.setPreferredSize(new java.awt.Dimension(195, 19));
        formPanel1.add(xLabel4);

        xLabel3.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel3.setCaption("Date Transmitted");
        xLabel3.setFont(new java.awt.Font("Tahoma", 1, 11));
        xLabel3.setName("transmittal.dtTransmitted");
        xLabel3.setPreferredSize(new java.awt.Dimension(195, 19));
        formPanel1.add(xLabel3);

        xTable1.setHandler("listHandler");
        xTable1.setName("selectedItem");

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(xTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 305, Short.MAX_VALUE)
                    .add(jPanel1Layout.createSequentialGroup()
                        .add(formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 295, Short.MAX_VALUE)
                        .addContainerGap())))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 226, Short.MAX_VALUE)
                .addContainerGap())
        );
        jSplitPane1.setLeftComponent(jPanel1);

        jPanel4.add(jSplitPane1, java.awt.BorderLayout.CENTER);

        add(jPanel4, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSplitPane jSplitPane1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XActionBar xActionBar2;
    private com.rameses.rcp.control.XEditorPane xEditorPane1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel5;
    private com.rameses.rcp.control.XTable xTable1;
    // End of variables declaration//GEN-END:variables
    
}
