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
public enum Role {
    ADMIN{
        @Override
        public String toString() {
            return "Admin"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    BUSINESS{
        @Override
        public String toString() {
            return "Nhân viên kinh doanh"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    SALESMAN{
        @Override
        public String toString() {
            return "Nhân viên bán hàng"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    MANAGER{
        @Override
        public String toString() {
            return "Quản lý"; //To change body of generated methods, choose Tools | Templates.
        }
    },
    USER{
        @Override
        public String toString() {
            return "Khách hàng"; //To change body of generated methods, choose Tools | Templates.
        }
    }
}
