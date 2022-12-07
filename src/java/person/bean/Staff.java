/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package person.bean;

/**
 *
 * @author KANSHA
 */
public class Staff implements java.io.Serializable{
    int id=0;
    String name=null;
    double salary=0.0;
    String designation;
    
    public Staff(){
        
    }
    public Staff(String name, double salary, String designation){
        this.name=name;
        this.salary=salary;
        this.designation=designation;
    }
    public int getID(){return id;}
    public String getName(){return  name;}
    public String getDesignation(){return designation;}
    public double getSalary(){return salary;}
    
    public void setID(int id){ this.id=id;}
    public void setName(String name){ this.name=name;}
    public void setSalary(double salary){ this.salary=salary;}
    public void setDesignation(String designation){ this.designation=designation;}
}
