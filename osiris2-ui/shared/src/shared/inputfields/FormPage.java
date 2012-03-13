package shared.inputfields;
/*
 * FormPage.java
 *
 * Created on June 6, 2011, 11:43 AM
 * @author jaycverg
 */


public class FormPage extends javax.swing.JPanel {
    
    public FormPage() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jScrollPane1 = new javax.swing.JScrollPane();
        formPanel1 = new com.rameses.rcp.util.FormPanel();

        setLayout(new java.awt.BorderLayout());

        formPanel1.setCaptionWidth(150);
        formPanel1.setName("formControls");
        jScrollPane1.setViewportView(formPanel1);

        add(jScrollPane1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration//GEN-END:variables
    
}
