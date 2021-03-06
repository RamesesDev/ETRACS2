/*
 * AccountPage.java
 *
 * Created on February 27, 2011, 12:48 PM
 */

package etracs2.entity;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamss
 */
@StyleSheet("etracs2/entity/EntityForMappingPage.style")
public class EntityForMappingPage extends javax.swing.JPanel {
    
    /** Creates new form AccountPage */
    public EntityForMappingPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jSplitPane1 = new javax.swing.JSplitPane();
        jPanel1 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        jPanel2 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        xDataTable2 = new com.rameses.rcp.control.XDataTable();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        jPanel5 = new javax.swing.JPanel();
        xActionBar2 = new com.rameses.rcp.control.XActionBar();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLabel5 = new com.rameses.rcp.control.XLabel();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(748, 396));
        jSplitPane1.setDividerLocation(400);
        jPanel1.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Listing");
        jPanel1.setBorder(xTitledBorder1);
        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel3.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 1, 3, 5));
        xActionTextField1.setActionName("search");
        xActionTextField1.setCaptionMnemonic('h');
        xActionTextField1.setHint("Search");
        xActionTextField1.setIndex(-1);
        xActionTextField1.setName("searchText");
        xActionTextField1.setPreferredSize(new java.awt.Dimension(200, 19));
        jPanel3.add(xActionTextField1, java.awt.BorderLayout.WEST);

        jPanel1.add(jPanel3, java.awt.BorderLayout.NORTH);

        xDataTable1.setHandler("listHandler");
        xDataTable1.setImmediate(true);
        xDataTable1.setName("selectedItem");
        jPanel1.add(xDataTable1, java.awt.BorderLayout.CENTER);

        jSplitPane1.setLeftComponent(jPanel1);

        jPanel2.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Mapping Information");
        jPanel4.setBorder(xTitledBorder2);
        xDataTable2.setDepends(new String[] {"selectedItem"});
        xDataTable2.setHandler("mappingListHandler");
        xDataTable2.setName("selectedMapping");

        xLookupField1.setCaption("Search Entity to Map:");
        xLookupField1.setCaptionWidth(120);
        xLookupField1.setDepends(new String[] {"selectedItem"});
        xLookupField1.setHandler("lookupEntity");
        xLookupField1.setIndex(-100);
        xLookupField1.setName("mapping");
        xLookupField1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel2.add(xLookupField1);

        org.jdesktop.layout.GroupLayout jPanel4Layout = new org.jdesktop.layout.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 353, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xDataTable2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 550, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel4Layout.createSequentialGroup()
                .add(formPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xDataTable2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 253, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel2.add(jPanel4, java.awt.BorderLayout.CENTER);

        jPanel5.setLayout(new java.awt.BorderLayout());

        xActionBar2.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar2.setDepends(new String[] {"selectedItem"});
        xActionBar2.setName("formActions");
        jPanel5.add(xActionBar2, java.awt.BorderLayout.NORTH);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setTitle("Entity Information");
        formPanel1.setBorder(xTitledBorder3);
        formPanel1.setPreferredSize(new java.awt.Dimension(114, 145));
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setCaption("Domain ID");
        xLabel1.setCaptionWidth(100);
        xLabel1.setDepends(new String[] {"selectedItem"});
        xLabel1.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel1.setName("entity.domainid");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel1);

        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setCaption("Domain Name");
        xLabel2.setCaptionWidth(100);
        xLabel2.setDepends(new String[] {"selectedItem"});
        xLabel2.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel2.setName("entity.domainname");
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel2);

        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel3.setCaption("Entity No.");
        xLabel3.setCaptionWidth(100);
        xLabel3.setDepends(new String[] {"selectedItem"});
        xLabel3.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel3.setName("entity.entityno");
        xLabel3.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel3);

        xLabel4.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel4.setCaption("Entity Name");
        xLabel4.setCaptionWidth(100);
        xLabel4.setDepends(new String[] {"selectedItem"});
        xLabel4.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel4.setName("entity.entityname");
        xLabel4.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel4);

        xLabel5.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel5.setCaption("Address");
        xLabel5.setCaptionWidth(100);
        xLabel5.setDepends(new String[] {"selectedItem"});
        xLabel5.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel5.setName("entity.entityaddress");
        xLabel5.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel5);

        jPanel5.add(formPanel1, java.awt.BorderLayout.CENTER);

        jPanel2.add(jPanel5, java.awt.BorderLayout.NORTH);

        jSplitPane1.setRightComponent(jPanel2);

        add(jSplitPane1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JSplitPane jSplitPane1;
    private com.rameses.rcp.control.XActionBar xActionBar2;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XDataTable xDataTable2;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel5;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    // End of variables declaration//GEN-END:variables
    
}
