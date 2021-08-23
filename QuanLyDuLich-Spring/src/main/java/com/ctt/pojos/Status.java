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
public enum Status {
    ACTIVE{
        @Override
        public String toString() {
            return "Active"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    CANCELLED{
        @Override
        public String toString() {
            return "Cancelled";
        }
    },
    ARCHIVED{
        @Override
        public String toString() {
            return "Archived";
        }
    }
}
