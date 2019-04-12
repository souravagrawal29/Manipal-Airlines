/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helloworld;

import java.sql.*;
//import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


public class Book extends javax.swing.JFrame {
    
    /**
	 * 
	 */
	//private static final long serialVersionUID = 1L;
	public String BookDate;
    public String Source;
    public String Destination;
    public String Selection;
    public String ID;

    /**
     * Creates new form Book
     */
    public Book() {
        initComponents();
    }
    
    public String GetType(String s){
        String type = "";
        switch(s){
            case "AIR":{
                type = "AIRBUS ";
                break;
            }
            case "ATR":{
                type = "TWOSEATER";
                break;
            }
            case "BOE":{
                type = "BOEING     ";
                break;
            }
            case "PAS":{
                type = "Passenger";
                break;
            }
            case "A380":{
                type = "AIRBUS-380 ";
                break;
            }
            case "MINI":{
            	type = "PRIVATE    " ;
            	break;
             }
        }
        return(type);
    }
    
    public String GetDays(String s){
        String days = "";
        if(s.charAt(0) == '1'){
            days = days + "S ";
        }
        else{
            days = days + "_ ";
        }
        if(s.charAt(1) == '1'){
            days = days + "M ";
        }
        else{
            days = days + "_ ";
        }
        if(s.charAt(2) == '1'){
            days = days + "T ";
        }
        else{
            days = days + "_ ";
        }
        if(s.charAt(3) == '1'){
            days = days + "W ";
        }
        else{
            days = days + "_ ";
        }
        if(s.charAt(4) == '1'){
            days = days + "T ";
        }
        else{
            days = days + "_ ";
        }
        if(s.charAt(5) == '1'){
            days = days + "F ";
        }
        else{
            days = days + "_ ";
        }
        if(s.charAt(6) == '1'){
            days = days + "S ";
        }
        else{
            days = days + "_ ";
        }
        return(days);
    }
    
    public String GetAirport(String s){
        String s_id = "";
        for(int i = 0;i < s.length();i++){
            if(s.charAt(i) == '('){
                for(int j = i+1;s.charAt(j) != ')';j++){
                    s_id = s_id + s.charAt(j);
                }
                return(s_id);
            }
        }
        return(s_id);
    }
    
    public void SetValues(){
        Connection ConnectionObj = null;
        Statement StatementObj = null;
        ResultSet ResultSetObj = null;
        if(BookDate.equals("(-none-)")){
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                ConnectionObj = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","avi141","avi123");
                StatementObj = ConnectionObj.createStatement();
                ResultSetObj = StatementObj.executeQuery("SELECT COUNT(Flight_no) FROM Flights WHERE from_id = '" + GetAirport(this.Source) + "' AND to_id = '" + GetAirport(this.Destination) + "'");
                ResultSetObj.next();
                int rowCount = Integer.parseInt(ResultSetObj.getString(1));
                String[] listData;
                ResultSetObj = StatementObj.executeQuery("SELECT * FROM Flights WHERE from_id = '" + GetAirport(this.Source) + "' AND to_id = '" + GetAirport(this.Destination) + "'");
                if(rowCount == 0){
                    listData = new String[1];
                    listData[0] = "No Flights flying for entered destinations.";
                    jList1.setListData(listData);
                }
                else{
                    listData = new String[rowCount];
                    int i = 0;
                    while(ResultSetObj.next()){
                        listData[i++] = ResultSetObj.getString(1) + "  " + ResultSetObj.getString(2) + " - " + ResultSetObj.getString(3) + "  " + GetType(ResultSetObj.getString(5)) + "                " + GetDays(ResultSetObj.getString(6));
                    }
                    jList1.setListData(listData);
                }
            } catch (Exception ex) {
                Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally{
                try{
                    ConnectionObj.close();
                    StatementObj.close();
                }
                catch(Exception e){
                    Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        }
        else{
            try {
                java.util.Date date = new SimpleDateFormat("dd-MMM-yy").parse(BookDate);
                Calendar c = Calendar.getInstance();
                c.setTime(date);
                int f = c.get(Calendar.DAY_OF_WEEK);
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    ConnectionObj = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","avi141","avi123");
                    StatementObj = ConnectionObj.createStatement();
                    ResultSetObj = StatementObj.executeQuery("SELECT COUNT(Flight_no) FROM Flights WHERE from_id = '" + GetAirport(this.Source) + "' AND to_id = '" + GetAirport(this.Destination) + "'");
                    ResultSetObj.next();
                    int rowCount = Integer.parseInt(ResultSetObj.getString(1));
                    String[] listData;
                    ResultSetObj = StatementObj.executeQuery("SELECT * FROM Flights WHERE from_id = '" + GetAirport(this.Source) + "' AND to_id = '" + GetAirport(this.Destination) + "'");
                    if(rowCount == 0){
                        listData = new String[1];
                        listData[0] = "No Flights flying for entered destinations.";
                        jList1.setListData(listData);
                   // ID=this.Selection.substring(0,5);
                    //String s1="SELECT fare FROM Flights WHERE Flight_no='"+this.ID+'"';
                    }
                    else{
                        listData = new String[rowCount];
                        int i = 0;
                        while(ResultSetObj.next()){
                            if(ResultSetObj.getString(6).charAt(f-1) == '1'){
                                listData[i++] = ResultSetObj.getString(1) + "  " + ResultSetObj.getString(2) + " - " + ResultSetObj.getString(3) + "  " + GetType(ResultSetObj.getString(5)) + "                " + GetDays(ResultSetObj.getString(6));
                            }
                        }
                        jList1.setListData(listData);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
                }
                finally{
                    try{
                        ConnectionObj.close();
                        StatementObj.close();
                    }
                    catch(Exception e){
                        Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, e);
                    }
                }
            }catch (Exception ex) {
                Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
  //  @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        jButton2 = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jList1.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jList1.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jList1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jList1MouseClicked(evt);
            }
        });
        jList1.addListSelectionListener(new javax.swing.event.ListSelectionListener() {
            public void valueChanged(javax.swing.event.ListSelectionEvent evt) {
                jList1ValueChanged(evt);
            }
        });
        jScrollPane1.setViewportView(jList1);

        jButton2.setText("Home");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jLabel4.setFont(new java.awt.Font("Arial", 1, 24)); // NOI18N
        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel4.setText("AVAILABLE FLIGHTS");

        jButton3.setText("Back");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setText("Proceed");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 424, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jButton2)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 369, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(96, 96, 96)
                        .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(44, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(26, 26, 26)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 142, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(28, 28, 28)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(28, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jList1ValueChanged(javax.swing.event.ListSelectionEvent evt) {//GEN-FIRST:event_jList1ValueChanged
        // TODO add your handling code here:
    }//GEN-LAST:event_jList1ValueChanged

    private void jList1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jList1MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_jList1MouseClicked

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        this.setVisible(false);
        Welcome WelcomeObj = new Welcome();
        WelcomeObj.setLocationRelativeTo(null);
        WelcomeObj.setVisible(true);
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        this.setVisible(false);
        Search SearchObj = new Search();
        SearchObj.setLocationRelativeTo(null);
        SearchObj.setVisible(true);
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // TODO add your handling code here:
        this.Selection = jList1.getSelectedValue();
        if(jList1.getSelectedIndex() == -1){
            JOptionPane.showMessageDialog(null, "Select something.", "Invalid", JOptionPane.INFORMATION_MESSAGE);
        }
        else if(this.Selection.equals("No Flights for entered destinations.")){
            JOptionPane.showMessageDialog(null, "We will start this service shortly.", "Sorry for inconvinience", JOptionPane.INFORMATION_MESSAGE);
        }
        else if(this.BookDate.equals("(-none-")){
            JOptionPane.showMessageDialog(null, "Go back and select a date for the available flights.", "Select journey date", JOptionPane.INFORMATION_MESSAGE);
        }
        else{
            this.setVisible(false);
            EnterDetails EnterDetailsObj = new EnterDetails();
            EnterDetailsObj.Selection = this.Selection;
            EnterDetailsObj.book_date = this.BookDate;
            EnterDetailsObj.setLocationRelativeTo(null);
            EnterDetailsObj.setVisible(true);
        }
    }//GEN-LAST:event_jButton4ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Book.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Book.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Book.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Book.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                Book BookObj = new Book();
                BookObj.setLocationRelativeTo(null);
                BookObj.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JList<String> jList1;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration//GEN-END:variables
}
