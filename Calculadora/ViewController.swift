//
//  ViewController.swift
//  Calculadora
//
//  Created by alan on 03/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var valorInserido = ""
    var primeiroNumero = ""
    var segundoNumero = ""
    var operacaoAritmetica = false
    var pontoFlutuante = false
    var tipoOperacao = ""
    
    
    @IBOutlet weak var display: UILabel!
    
    func inserirValor(valor: String) {
        if !operacaoAritmetica {
            primeiroNumero = valor
            display.text = valor
        } else {
            segundoNumero = valor
            display.text = valor
        }
    }
    
    func calcularResultado() {
        let primeiroOperando = Double(primeiroNumero) ?? 0.0
        let segundoOperando = Double(segundoNumero) ?? 0.0
        switch tipoOperacao {
        case "somar":
            primeiroNumero = String(primeiroOperando + segundoOperando)
        case "subtrair":
            primeiroNumero = String(primeiroOperando - segundoOperando)
        case "multiplicar":
            primeiroNumero = String(primeiroOperando * segundoOperando)
        default:
            if(segundoOperando != 0) {
                primeiroNumero = String(primeiroOperando / segundoOperando)
            }
        }
        display.text = tipoOperacao == "dividir" && segundoOperando == 0 ? "Não é um número" : primeiroNumero
    }
    
    @IBAction func num0(_ sender: UIButton) {
        valorInserido += "0"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num1(_ sender: UIButton) {
        valorInserido += "1"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num2(_ sender: UIButton) {
        valorInserido += "2"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num3(_ sender: UIButton) {
        valorInserido += "3"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num4(_ sender: UIButton) {
        valorInserido += "4"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num5(_ sender: UIButton) {
        valorInserido += "5"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num6(_ sender: UIButton) {
        valorInserido += "6"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num7(_ sender: UIButton) {
        valorInserido += "7"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num8(_ sender: UIButton) {
        valorInserido += "8"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func num9(_ sender: UIButton) {
        valorInserido += "9"
        inserirValor(valor: valorInserido)
    }
    
    @IBAction func somar(_ sender: Any) {
        calcularResultado()
        tipoOperacao = "somar"
        operacaoAritmetica = true
        valorInserido = ""
    }
    
    @IBAction func subtrair(_ sender: Any) {
        calcularResultado()
        tipoOperacao = "subtrair"
        operacaoAritmetica = true
        valorInserido = ""
    }
    
    @IBAction func multiplicar(_ sender: Any) {
        calcularResultado()
        tipoOperacao = "multiplicar"
        operacaoAritmetica = true
        valorInserido = ""
    }
    @IBAction func dividir(_ sender: Any) {
        calcularResultado()
        tipoOperacao = "dividir"
        operacaoAritmetica = true
        valorInserido = ""
    }
    @IBAction func pontoFlutuante(_ sender: Any) {
        pontoFlutuante = true
        if !valorInserido.contains(".") {
            valorInserido += "."
            inserirValor(valor: valorInserido)
        }

    }
    
    @IBAction func percentual(_ sender: Any) {
        if !operacaoAritmetica {
            let numeroInteiro = Double(valorInserido)!
            let numeroPorcentual = numeroInteiro / 100
            primeiroNumero = String(numeroPorcentual)
            display.text = primeiroNumero
        } else {
            let numeroInteiro = Double(valorInserido)!
            let numeroPorcentual = numeroInteiro / 100
            segundoNumero = String(numeroPorcentual)
            display.text = segundoNumero
        }
    }
    
    @IBAction func mudarSinal(_ sender: Any) {
        if !operacaoAritmetica {
            let primeiroNumeroSinal = Double(valorInserido)!
            primeiroNumero = String(primeiroNumeroSinal * (-1))
            valorInserido = primeiroNumero
            display.text = primeiroNumero
        } else {
            let segundoNumeroSinal = Double(valorInserido) ?? 0.0
            segundoNumero = String(segundoNumeroSinal * (-1))
            display.text = segundoNumero
        }
    }
    
    @IBAction func cancelar(_ sender: Any) {
        valorInserido = ""
        primeiroNumero = ""
        segundoNumero = ""
        operacaoAritmetica = false
        tipoOperacao = ""
        display.text = "0"
    }
    
    @IBAction func resultado(_ sender: Any) {
        calcularResultado()
        tipoOperacao = ""
        primeiroNumero = ""
        segundoNumero = ""
        valorInserido = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

