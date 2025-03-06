//
//  LocalFileManager.swift
//  CryptoDemo
//
//  Created by ma23001 on 3/6/25.
//

import Foundation
import SwiftUI

final class LocalFileManager {
    
    static let instance = LocalFileManager()
    private let fileManager = FileManager.default
    
    private init() {}
    
    func saveImage(_ image: UIImage, imageName: String, folderName: String) {
        
        createFolderIfNeeded(folderName: folderName)
        
        guard let data = image.pngData(),
              let url = getURLForImage(name: imageName, folderName: folderName)
        else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. \(error)")
        }
    }
    
    func loadImage(name: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(name: name, folderName: folderName),
              fileManager.fileExists(atPath: url.path) else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(name: folderName) else { return }
        if !fileManager.fileExists(atPath: url.path) {
            do {
                try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLForFolder(name: String) -> URL? {
        
        guard let url = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {
            return nil
        }
        
        return url.appendingPathComponent(name)
    }
    
    private func getURLForImage(name: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(name: folderName) else {
            return nil
        }
        
        return folderURL.appendingPathComponent(name + ".png")
    }
}
