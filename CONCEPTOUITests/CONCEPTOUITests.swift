//
//  CONCEPTOUITests.swift
//  CONCEPTOUITests
//
//  Created by Irvin Mundo on 28/04/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import XCTest
@testable import CONCEPTO

class PruebasUnitariasTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPausaStreaming(){
        let resultado=RadioPlayer()
        XCTAssertEqual(resultado.currentlyPlaying(), false)
    }
    func testPausaPodcast(){
        let resultado=PodcastPlayer()
        XCTAssertEqual(resultado.currentlyPlaying(), false)
    }
    func conexion(){
        let resultado = FirstViewController()
        XCTAssertEqual(resultado.checarConexion(), true)
        
            }
    func testConceptoRadial(){
        let resultado=SeleccionPodcast2TableViewController()
        XCTAssertEqual(resultado.direccion, "http://conceptoradial.000webhostapp.com/json/podcasts3.json")
    }
    func testConceptoRadialJSON(){
        let resultado=SeleccionPodcast2TableViewController()
        XCTAssertEqual(resultado.datosJSON, "[{\"título\": \"pod1\", \"URL\": \"http://mx.ivoox.com/es/sintonia-capital-seguridad-mexico-14-mar_mf_17565955_feed_1.mp3?_=1\"}]")
    }
    func testConceptoRadialDir(){
        let resultado=RadioPlayer()
        XCTAssertEqual(resultado.conceptoradial, "https://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://us3.internet-radio.com:8007/listen.pls&t=.pls")
    }

   // http://204.12.193.98:8139/listen.pls
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
