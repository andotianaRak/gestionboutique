/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package boutique;

import java.sql.Connection;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author User
 */
public class FonctionTest {
    
    public FonctionTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getConnexion method, of class Fonction.
     */
    
    /**
     * Test of insertCategorie method, of class Fonction.
     */
    @Test
    public void testInsertCategorie() throws Exception {
        System.out.println("insertCategorie");
        String cat = "tee-shirt";
        Fonction instance = new Fonction();
        instance.insertCategorie(cat);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of addition method, of class Fonction.
     */
    @Test
    public void testAddition() {
        System.out.println("addition");
        int a = 0;
        int b = 0;
        Fonction instance = new Fonction();
        int expResult = 0;
        int result = instance.addition(a, b);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
}
