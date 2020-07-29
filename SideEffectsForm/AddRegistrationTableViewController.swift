//
//  AddRegistrationTableViewController.swift
//  SideEffectsForm
//
//  Created by Filip Handzel on 18/06/2020.
//  Copyright © 2020 Filip Handzel. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController//, //SelectedRomTypeTableViewControllerDelegate
{
    
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var initialsTextField: UITextField!
    @IBOutlet weak var bodyHeightTextField: UITextField!
    @IBOutlet weak var bodyWeightTextField: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var pregnacySegment: UISegmentedControl!
    
    @IBOutlet weak var pregnacyTableViewCell: UITableViewCell!
    
    @IBOutlet weak var pregnacyWeekTableViewCell: UITableViewCell!
    
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var dateOfBirthPicker: UIDatePicker!
    @IBOutlet weak var dateOfIssueLabel: UILabel!
    
    @IBOutlet weak var dateOfIssuePicker: UIDatePicker!
    @IBOutlet weak var additionalInfoTextField: UITextView!
    @IBOutlet weak var descTextField: UITextView!
    
    
    @IBOutlet weak var dosingStartLabel: UILabel!
    @IBOutlet weak var dosingStartPicker: UIDatePicker!
    

    @IBOutlet weak var dosingEndLabel: UILabel!
    @IBOutlet weak var dosingEndPicker: UIDatePicker!
    
    
    
    //@IBOutlet weak var numberOfChildrenLabel: UILabel!
    //@IBOutlet weak var numberOfChildrenStepper: UIStepper!
    //@IBOutlet weak var numberOfAdultLabel: UILabel!
    //@IBOutlet weak var numberOfAdultStepper: UIStepper!
    
    
    //MARK: - Index paths
    
    let dateOfBirthLabelCellIndexPath = IndexPath(row: 1, section: 0)
    let dateOfBirthPickerCellIndexPath = IndexPath(row: 2, section: 0)
    
    let dateOfIssueLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let dateOfIssuePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let sideEffectDescriptionCellIndexPath = IndexPath(row: 3, section: 1)
    let listOfconsequencesCellIndexPath = IndexPath(row: 7, section: 1)
    
    let dateOfDosingStartLabelCellIndexPath = IndexPath(row: 3, section: 2)
    let dateOfDosingStartPickerCellIndexPath = IndexPath(row: 4, section: 2)
    let dateOfDosingEndLabelCellIndexPath = IndexPath(row: 5, section: 2)
    let dateOfDosingEndPickerCellIndexPath = IndexPath(row: 6, section: 2)
    
    let additionalInformationCellIndexPath = IndexPath(row: 1, section: 3)
    
    //MARK: - Showing/hide data pickers
    
    private var isDateOfBirthPickerShown: Bool = false {
        didSet {
            dateOfBirthPicker.isHidden = !isDateOfBirthPickerShown
        }
    }
    
    private var isDateOfIssuePickerShown: Bool = false {
           didSet {
               dateOfIssuePicker.isHidden = !isDateOfIssuePickerShown
           }
       }
    
    private var isDateOfDosingStartPickerShown: Bool = false {
        didSet {
            dosingStartPicker.isHidden = !isDateOfDosingStartPickerShown
        }
    }
        
    private var isDateOfDosingEndPickerShown: Bool = false {
           didSet {
            dosingEndPicker.isHidden = !isDateOfDosingEndPickerShown
           }
    }
    
    // MARK: - Registration
    
    //var productUsed: ProductUsed?
    
    var registration: Registration? {
        //guard let productUsed = productUsed else { return nil }
        
        let initials = initialsTextField.text ?? ""
        let bodyHeight = bodyHeightTextField.text ?? ""
        let bodyWeight = bodyWeightTextField.text ?? ""
        
        let dateOfBirth = dateOfBirthPicker.date
        let gender = genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex);
        
        let dateOfIssue = dateOfIssuePicker.date
        //let desc = descTextField.text ?? ""
        let additionalInfo = additionalInfoTextField.text ?? ""
        
        return Registration(initials: initials, dateOfBirth: dateOfBirth, gender: gender, bodyHeight: bodyHeight, bodyWeight: bodyWeight, dateOfIssue: dateOfIssue, additionalInfo: additionalInfo
        )
            
    }
    
    
    //MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //genderSegment.selectedSegmentIndex = 0;
        
        let todayDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        dateOfBirthPicker.maximumDate = todayDate
        dateOfIssuePicker.maximumDate = todayDate
        dosingStartPicker.maximumDate = todayDate
        dosingEndPicker.maximumDate = todayDate
        
//        let midnightToday = Calendar.current.startOfDay(for: Date())
//        checkInDatePicker.minimumDate = midnightToday
//        checkInDatePicker.date = midnightToday
//
        updateDateViews()

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SelectRoomType" {
//            let destinationViewController = segue.destination as? SelectedRomTypeTableViewController
//            destinationViewController?.delegate = self
//            //destinationViewController?.roomType = roomType
//        }
//    }
    
    //MARK: - Update data
    
    private func updateDateViews() {
//        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(24 * 3600)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        let compDosingStart = Calendar.current.dateComponents([.hour, .minute], from: dosingStartPicker.date)
        let hourStart = compDosingStart.hour!
        let minuteStart = compDosingStart.minute!
        
        let compDosingEnd = Calendar.current.dateComponents([.hour, .minute], from: dosingEndPicker.date)
        let hourEnd = compDosingEnd.hour!
        let minuteEnd = compDosingEnd.minute!
        
        dateOfBirthLabel.text = dateFormatter.string(from: dateOfBirthPicker.date)
        dateOfIssueLabel.text = dateFormatter.string(from: dateOfIssuePicker.date)
        dosingStartLabel.text = "\(dateFormatter.string(from: dosingStartPicker.date)) \(hourStart):\(minuteStart)"
        dosingEndLabel.text = "\(dateFormatter.string(from: dosingEndPicker.date)) \(hourEnd):\(minuteEnd)"
        
    }
    
//    private func updateNumberOfGuests() {
//        numberOfAdultLabel.text = "\(Int(numberOfAdultStepper.value))"
//        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
//    }
    
//    private func updateRoomType() {
//        if let roomType = roomType {
//            roomTypeLabel.text = roomType.name
//        } else {
//            roomTypeLabel.text = "Not Set"
//        }
//    }
    
    
    //MARK: - Actions
    
//    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//        updateNumberOfGuests()
//    }
    
    
    @IBAction func genderChanged(_ sender: Any) {
        switch genderSegment.selectedSegmentIndex
        {
        case 0:
            print("Male")
        case 1:
            print("Female")
        default:
            break
        }
    }
    
    
    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        updateDateViews()
    }
    

    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        
        let initials = initialsTextField.text ?? ""
        let bodyHeight = bodyHeightTextField.text ?? ""
        let bodyWeight = bodyWeightTextField.text ?? ""
        let dateOfBirth = dateOfBirthPicker.date
        let dateOfIssue = dateOfIssuePicker.date
        let additionalInfo = additionalInfoTextField.text ?? ""
       // let numberOfAdults = Int(numberOfAdultStepper.value)
        //let numberOfChildren = Int(numberOfAdultStepper.value)
        //let hasMale = genderSwitch.isOn
        //let roomChoice = roomType?.name ?? "Not Set"
        
        
        print("DONE TAPPED")
        print("initials: \(initials)")
        print("bodyHeight: \(bodyHeight)")
        print("bodyWeight: \(bodyWeight)")
        print("dateOfBirth: \(dateOfBirth)")
        print("dateOfIssue: \(dateOfIssue)")
        print("additionalInfo: \(additionalInfo)")
        //print("checkOutDate: \(checkOutDate)")
        //print("numberOfAdults: \(numberOfAdults)")
        //print("numberOfChildren: \(numberOfChildren)")
        //print("hasMale: \(hasMale)")
        //print("roomChoice: \(roomChoice)")

    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
            switch indexPath {
            case dateOfBirthPickerCellIndexPath:
                
                if isDateOfBirthPickerShown {
                    return 216
                } else {
                    return 0
                }
            case dateOfIssuePickerCellIndexPath:
            
                if isDateOfIssuePickerShown {
                    return 216
                } else {
                    return 0
                }
                
            case dateOfDosingStartPickerCellIndexPath:
            
                if isDateOfDosingStartPickerShown {
                    return 216
                } else {
                    return 0
                }
                
            case dateOfDosingEndPickerCellIndexPath:
            
                if isDateOfDosingEndPickerShown {
                    return 216
                } else {
                    return 0
                }
                
            case sideEffectDescriptionCellIndexPath:
                return 88
                
            case listOfconsequencesCellIndexPath:
                return 66
                
            case additionalInformationCellIndexPath:
                return 88
    
            default:
                return 44.0
        }
   }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.red
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.red
        
        switch section {
            case 0:
                header.textLabel?.text = "Patient information: ";
            case 1:
                header.textLabel?.text = "Side effects information: ";
            case 2:
                header.textLabel?.text = "Information on used medical products: ";
            default:
                header.textLabel?.text = "Information: "
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case dateOfBirthLabelCellIndexPath:
            
            if isDateOfBirthPickerShown {
                isDateOfBirthPickerShown = false
            } else {
                isDateOfBirthPickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case dateOfIssueLabelCellIndexPath:
            if isDateOfIssuePickerShown {
                isDateOfIssuePickerShown = false
            } else {
                isDateOfIssuePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case dateOfDosingStartLabelCellIndexPath:
            if isDateOfDosingStartPickerShown {
                isDateOfDosingStartPickerShown = false
            } else {
                isDateOfDosingStartPickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case dateOfDosingEndLabelCellIndexPath:
        if isDateOfDosingEndPickerShown {
            isDateOfDosingEndPickerShown = false
        } else {
            isDateOfDosingEndPickerShown = true
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
            
        default:
            break
        }
    }
    
    // MARK: SelectedRoomType Delegate
    
//    func didSelect(roomType: RoomType) {
//        self.roomType = roomType
//        updateRoomType()
//    }
}
