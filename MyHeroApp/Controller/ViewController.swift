//
//  ViewController.swift
//  MyHeroApp
//
//  Created by Agus Adi Pranata on 07/05/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heroTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pahlawan Indonesia"

        // Do any additional setup after loading the view.
        heroTableView.dataSource = self
        
        heroTableView.delegate = self
        
        heroTableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as! HeroTableViewCell
        
        let hero = heroes[indexPath.row]
        cell.nameHero.text = hero.name
        cell.descHero.text = hero.desc
        cell.photoHero.image = hero.photo
        
        cell.photoHero.layer.cornerRadius = cell.photoHero.frame.height / 2
        cell.photoHero.clipsToBounds = true
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.hero = heroes[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
