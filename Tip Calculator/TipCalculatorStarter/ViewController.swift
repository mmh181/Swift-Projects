
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var headerView: UIView!
    @IBOutlet var titleLabel: UILabel!
   // @IBOutlet var themeSwitch: UISwitch!
    @IBOutlet var outputCardView: UIView!
    @IBOutlet var billAmountTextField: BillAmountTextField!
    @IBOutlet var tipPercentSegmentedControl: UISegmentedControl!
    
    @IBOutlet var inputCardView: UIView!
    @IBOutlet var tipAmountTitleLabel: UILabel!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var totalAmountTitleLabel: UILabel!
    @IBOutlet var totalAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.calculateButtonAction = {
            self.calculate()
        }
    }
    
    func calculate() {
        // dismiss keyboard
        if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
        }

        guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                clear()
                return
        }

        let roundedBillAmount = (100 * billAmount).rounded() / 100

        let tipPercent: Double
        switch tipPercentSegmentedControl.selectedSegmentIndex {
        case 0:
            tipPercent = 0.10
        case 1:
            tipPercent = 0.15
        case 2:
            tipPercent = 0.20
        default:
            preconditionFailure("Unexpected index.")
        }

        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = (100 * tipAmount).rounded() / 100

        let totalAmount = roundedBillAmount + roundedTipAmount

        // Update UI
        self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
        self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
    }
    
    func clear() {
        billAmountTextField.text = nil
        tipPercentSegmentedControl.selectedSegmentIndex = 0
        tipAmountLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
    }
    
   // @IBAction func themeToggled(_ sender: UISwitch) {
        
         //   if sender.isOn {
          //      print("switch toggled on")
        //    } else {
         //       print("switch toggled off")
        //    }
      //  }
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
        calculate()
    }
    @IBAction func resetButtonTapped(_ sender: Any) {
            clear()
            }
}


