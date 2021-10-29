//
//  ViewController.swift
//  faviorteMovie
//
//  Created by BRYAN RUIZ on 10/19/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tabelViewO: UITableView!
    var movies:[MovieClass] = []
    var f:MovieClass?
    var alert = UIAlertController(title: "add", message: "enter relevent info", preferredStyle: .alert)
    var alertB = UIAlertController(title: "bad", message: "empty textfield", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelViewO.delegate = self
        tabelViewO.dataSource = self
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alertB.addAction(UIAlertAction(title: "cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [self, weak alert] (_) in let textfield = alert?.textFields![0]
            let textField2 = alert?.textFields![1]
            let textField3 = alert?.textFields![2]
            if textfield!.text == "" || textField2!.text == "" {
                present(alertB, animated: true, completion: nil)
            } else {
                if textField3?.text == "" {
                    movies.append(MovieClass(n: textfield!.text!, r: textField2!.text!))
                    } else {
                        movies.append(MovieClass(n: textfield!.text!, r: textField2!.text!,a: textField3!.text! )) }
                tabelViewO.reloadData()
            }
        }))
        for i in 0..<12{
            var rand = Int.random(in: 1...5)
            movies.append(MovieClass(n: "cars \(i+1)", r: "\(rand)/5 rating",a:"Owen Willson"))
        }
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelViewO.dequeueReusableCell(withIdentifier: "blah", for: indexPath)
        cell.textLabel?.text = "\(movies[indexPath.row].name)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        f = movies[indexPath.row]
        performSegue(withIdentifier: "blahs", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        movies.remove(at: indexPath.row)
        tabelViewO.reloadData()
        return UISwipeActionsConfiguration()
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
    present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController2
        nvc.blah = f
    }
}

