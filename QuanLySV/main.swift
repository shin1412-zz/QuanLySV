//
//  main.swift
//  QuanLySV
//
//  Created by Shin on 6/12/20.
//  Copyright © 2020 Shin. All rights reserved.
//

import Foundation
class SinhVien {
    var ten:String
    var tuoi:Int
    var sdt:String?
    
    init(ten:String, tuoi:Int, sdt:String?) {
        self.ten = ten
        self.tuoi = tuoi
        self.sdt = sdt
    }
    
    init(ten: String, tuoi:Int) {
        self.ten = ten
        self.tuoi = tuoi
    }
    
    func getInforSV() -> String {
        if self.sdt != nil{
            return "Tên: " + self.ten + ", Tuổi: " + String(self.tuoi) + ", Số điện thoại: " + self.sdt!
        }else{
            return "Tên: " + self.ten + ", Tuổi: " + String(self.tuoi)
        }
    }
    
}
class LopHoc {
    var lop:String
    var giaoVien:String
    var listSinhVien = [SinhVien]()
    
    init(lop:String, giaoVien:String) {
        self.lop = lop
        self.giaoVien = giaoVien
    }
    
    func getInforGV() -> String {
        return "Tên lớp: " + self.lop + "\nGiáo viên: " + self.giaoVien
    }
    
    func addSinhVien(ten:String, tuoi:Int, sdt:String?){
        let sinhVien = SinhVien(ten: ten, tuoi: tuoi, sdt: sdt)
        listSinhVien.append(sinhVien)
    }
    
    func addSV(arrSV:[SinhVien]) {
        listSinhVien.append(contentsOf: arrSV)
    }
    
    func updateTenGV(giaoVien:String) {
        self.giaoVien = giaoVien
    }
    
    func timSinhVien(ten:String) {
        if listSinhVien.count == 0 {
            print("Không có sinh viên trong lớp")
        }else{
            for i in 0..<listSinhVien.count {
                if listSinhVien[i].ten == ten {
                    listSinhVien[i].ten = "Đông"
                    print("Đổi tên \(ten) thành công")
                }/*else {
                    print("Không có sinh viên nào tên \(ten)")
                }
                break*/
            }
        }
    }
    
    func deleteSinhVien(ten:String) {
        if listSinhVien.count == 0 {
                print("Không có sinh viên trong lớp")
        }else   {
            for i in 0..<listSinhVien.count {
                if listSinhVien[i].ten == ten {
                    listSinhVien.remove(at: i)
                    print("Đã xoá thành công sinh viên \(ten)")
                    break
                }/*else {
                    print("Không có sinh viên nào tên \(ten)")
                    break
                }*/
            }
        }
    }
    
    func thongTinSV(){
        var sv = ""
        if listSinhVien.count > 0 {
            for i in listSinhVien {
                sv += i.getInforSV()
                sv += "\n"
            }
        }
        print(sv)
    }
}
    let sv1 = SinhVien(ten: "Nam", tuoi: 1)
    let sv2 = SinhVien(ten: "Hoàng", tuoi: 2)
    let sv3 = SinhVien(ten: "Linh", tuoi: 3, sdt: "11111")
    let sv4 = SinhVien(ten: "Huyền", tuoi: 4, sdt: "22222")
    let sv5 = SinhVien(ten: "Đức", tuoi: 5, sdt: "33333")
    let sv6 = SinhVien(ten: "Dương", tuoi: 6)
    let sv7 = SinhVien(ten: "Tùng", tuoi: 7, sdt: "123456")
    let sv8 = SinhVien(ten: "Bằng", tuoi: 8)
    let sv9 = SinhVien(ten: "Bắc", tuoi: 9, sdt: "123456")
    let sv10 = SinhVien(ten: "Thanh", tuoi: 10, sdt: "123456")
    
    let class1 = LopHoc(lop: "Techmaster", giaoVien: "Quỳnh")
    class1.updateTenGV(giaoVien: "Quỳnh Xinh")
    print(class1.getInforGV())
    class1.addSV(arrSV: [sv1, sv2, sv3, sv4, sv5, sv6, sv7, sv8, sv9, sv10])
    
    print("Số sinh viên trong lớp: \(class1.listSinhVien.count)")
    
    class1.timSinhVien(ten: "Nam")
    class1.timSinhVien(ten: "Bá")
    
    class1.deleteSinhVien(ten: "Bắc")
    class1.deleteSinhVien(ten: "Lan")
    
    class1.thongTinSV()
