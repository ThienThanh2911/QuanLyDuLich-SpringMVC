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
public enum Methods {
    ZALOPAY{
        @Override
        public String toString() {
            return "ZaloPay"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    MOMO{
        @Override
        public String toString() {
            return "Momo"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    CASH{
        @Override
        public String toString() {
            return "Cash"; //To change body of generated methods, choose Tools | Templates.
        }
    }
}
