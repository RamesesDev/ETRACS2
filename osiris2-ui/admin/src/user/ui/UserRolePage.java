package user.ui;

import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;
import templates.PopupTemplate;


/*
 * OrgPage.java
 *
 * Created on September 7, 2010, 11:12 AM
 * @author jaycverg
 */

@Template(PopupTemplate.class)
@StyleSheet
public class UserRolePage extends javax.swing.JPanel {
    
    public UserRolePage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        xLabel1 = new com.rameses.rcp.control.XLabel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();
        xTabbedPane1 = new Templates.Classes.XTabbedPane();

        setPreferredSize(new java.awt.Dimension(487, 445));
        xLabel1.setFont(new java.awt.Font("Arial", 1, 14));
        xLabel1.setName("formTitle");

        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setCaption("Role Name");
        xLabel2.setName("userrole.role");
        xLabel2.setPreferredSize(new java.awt.Dimension(250, 18));
        formPanel1.add(xLabel2);

        xActionTextField1.setEditable(false);
        xActionTextField1.setActionName("lookupGroup");
        xActionTextField1.setCaption("Group");
        xActionTextField1.setName("group");
        xActionTextField1.setPreferredSize(new java.awt.Dimension(250, 19));
        xActionTextField1.setRequired(true);
        formPanel1.add(xActionTextField1);

        xTextArea1.setColumns(25);
        xTextArea1.setRows(3);
        xTextArea1.setCaption("Description");
        xTextArea1.setName("userrole.description");
        xTextArea1.setPreferredSize(new java.awt.Dimension(250, 45));
        jScrollPane1.setViewportView(xTextArea1);

        formPanel1.add(jScrollPane1);

        xTabbedPane1.setDynamic(true);
        xTabbedPane1.setName("roleOptions");
        xTabbedPane1.setNameAutoLookupAsOpener(false);

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(20, 20, 20)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, xTabbedPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 457, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, xLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 457, Short.MAX_VALUE)
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 457, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(xLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 30, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xTabbedPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 283, Short.MAX_VALUE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private Templates.Classes.XTabbedPane xTabbedPane1;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    // End of variables declaration//GEN-END:variables
    
}
