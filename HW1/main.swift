//
//  main.swift
//  HW1
//
//  Created by Jarae on 13/1/23.
//

import Foundation

//Создать класс Клиент с параметрами имя, фамилия, отчество, сумма кредита,
//срок кредита, сумма погашения,которая изначально равна 0.
//Создать класс Банк с параметрами клиенты. Создать внутри класса Банк функцию,
//рассчитывающая сумму кредита с процентами. Если клиент берет кредит на 1 год,
//то надбавка 30% (например: хочет взять 100000, то в итоге должен погасить 130000),
//на 2 - 15%, на 3 - 10%. Функция должна заполнять параметр сумма погашения для
//каждого клиента и распечататывать всю информацию клиента. Добавить
//вторую функцию, которая принимает одного клиента в аргументе,
//эта функция должна достать информацию по сумме погашения и
//распечатать график погашений по месяцам.


class Client {
    var name: String
    var lastName: String
    var middleName: String
    var amountOfCredit: Int
    var creditTerm: Int
    var refundAmount: Int
    
    init(name: String, lastName: String, middleName: String, amountOfCredit: Int, creditTerm: Int, refundAmount: Int) {
        self.name = name
        self.lastName = lastName
        self.middleName = middleName
        self.amountOfCredit = amountOfCredit
        self.creditTerm = creditTerm
        self.refundAmount = refundAmount
    }
}

class Bank {
    var clients = [Client]()
    
    func loanAmountWithPercentage() {
        for i in clients {
            var total = i.amountOfCredit
            if i.creditTerm == 1{
                total += total * 30 / 100
            }else if i.creditTerm == 2 {
                total += total * 15 / 100
            }else if i.creditTerm == 3 {
                total += total * 10 / 100
            }
            i.refundAmount = total
            print("ФИО: \(i.lastName) \(i.name) \(i.middleName)")
            print("Сумма кредита = \(i.amountOfCredit), Cрок кредита = \(i.creditTerm) год, Сумма погашения = \(i.refundAmount)\n")
        }
    }
    
    func paymentSchedule(_ client: Client) {
        let months = client.creditTerm * 12, inOne = client.refundAmount / months
        print("\nГрафик погашений \(client.lastName) \(client.name) по месяцам")
        for i in 1...months {
            print("сумма погашения на \(i) месяц = \(inOne). Остаток = \(client.refundAmount - (i * inOne) )")
        }
        
    }
}

var client1 = Client(name: "Altynai", lastName: "Erkinbek", middleName: "", amountOfCredit: 1000, creditTerm: 1, refundAmount: 0)
var client2 = Client(name: "Peri", lastName: "Sultanova", middleName: "", amountOfCredit: 500, creditTerm: 3, refundAmount: 0)
var bank = Bank()
bank.clients.append(client1)
bank.clients.append(client2)

bank.loanAmountWithPercentage()
bank.paymentSchedule(client1)
bank.paymentSchedule(client2)
