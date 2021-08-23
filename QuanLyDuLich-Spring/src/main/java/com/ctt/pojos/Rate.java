/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.pojos;

/**
 *
 * @author ADMIN
 */
public enum Rate {
    LIKE{
        @Override
        public String toString() {
            return "Like"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    DISLIKE{
        @Override
        public String toString() {
            return "Dislike"; //To change body of generated methods, choose Tools | Templates.
        }
    }
}
