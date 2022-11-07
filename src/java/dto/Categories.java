/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author LENOVO
 */
public class Categories {

    private int cateid;
    private String catename;

    public Categories() {
    }

    public Categories(int cateid, String catename) {
        this.cateid = cateid;
        this.catename = catename;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

}
