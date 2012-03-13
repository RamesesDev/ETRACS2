package user.ui;

import com.rameses.rcp.constant.TextCase;
import com.rameses.rcp.ui.annotations.StyleSheet;

/*
 * OrgPage.java
 *
 * Created on September 7, 2010, 11:12 AM
 * @author jaycverg
 */

@StyleSheet()
public class UserFormPage extends javax.swing.JPanel {
    
    public UserFormPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        xTextField7 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField8 = new com.rameses.rcp.control.XTextField();
        xTextField10 = new com.rameses.rcp.control.XTextField();
        xTextField9 = new com.rameses.rcp.control.XTextField();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        formPanel1.setCaptionWidth(100);
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setCaption("Parent Code");
        xLabel1.setName("entity.parentcode");
        xLabel1.setPreferredSize(new java.awt.Dimension(200, 20));
        formPanel1.add(xLabel1);

        xTextField4.setCaption("User ID");
        xTextField4.setName("entity.uid");
        xTextField4.setPreferredSize(new java.awt.Dimension(200, 19));
        xTextField4.setReplaceExpr(new String[] {"\\s+"});
        xTextField4.setReplaceString(new String[] {"_"});
        xTextField4.setRequired(true);
        formPanel1.add(xTextField4);

        xTextField7.setCaption("Last Name");
        xTextField7.setName("entity.lastname");
        xTextField7.setPreferredSize(new java.awt.Dimension(200, 19));
        xTextField7.setRequired(true);
        formPanel1.add(xTextField7);

        xTextField3.setCaption("First Name");
        xTextField3.setName("entity.firstname");
        xTextField3.setPreferredSize(new java.awt.Dimension(200, 19));
        xTextField3.setRequired(true);
        formPanel1.add(xTextField3);

        xTextField8.setCaption("Email");
        xTextField8.setIndex(1);
        xTextField8.setName("entity.contact.email");
        xTextField8.setPreferredSize(new java.awt.Dimension(150, 19));
        xTextField8.setTextCase(TextCase.NONE);
        formPanel1.add(xTextField8);

        xTextField10.setCaption("Mobile No.");
        xTextField10.setIndex(1);
        xTextField10.setName("entity.contact.mobile");
        xTextField10.setPreferredSize(new java.awt.Dimension(150, 19));
        formPanel1.add(xTextField10);

        xTextField9.setCaption("Phone No.");
        xTextField9.setIndex(1);
        xTextField9.setName("entity.contact.phone");
        xTextField9.setPreferredSize(new java.awt.Dimension(150, 19));
        formPanel1.add(xTextField9);

        xActionBar1.setDynamic(true);
        xActionBar1.setName("formActions");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(xActionBar1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 371, Short.MAX_VALUE)
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 318, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 31, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 210, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(50, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XTextField xTextField10;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField4;
    private com.rameses.rcp.control.XTextField xTextField7;
    private com.rameses.rcp.control.XTextField xTextField8;
    private com.rameses.rcp.control.XTextField xTextField9;
    // End of variables declaration//GEN-END:variables
    
}
