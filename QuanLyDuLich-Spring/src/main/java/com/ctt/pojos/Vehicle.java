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
public enum Vehicle {
    YACHT{
        @Override
        public String toString() {
            return "Yacht"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    OTO{
        @Override
        public String toString() {
            return "Oto"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    PLANE{
        @Override
        public String toString() {
            return "Plane"; //To change body of generated methods, choose Tools | Templates.
        }
    }
}
