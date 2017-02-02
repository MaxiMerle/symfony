<?php
// src/Devschool/CinemaBundle/Controller/DefaultController.php
namespace Devschool\CinemaBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="page_accueil")
     */
    public function indexAction()
    {
        return $this->render('DevschoolCinemaBundle:Default:index.html.twig');
    }
        /**
    * @Route("/films", name="page_films")
    */
    public function listAction()

    {
    	$films = $this->getDoctrine()->getRepository('DevschoolCinemaBundle:Film')->findAll();
    	$titre_de_la_page = 'Liste de Film';
        return $this->render('DevschoolCinemaBundle:Film:list.html.twig',
        	['films' => $films, 'titre' => $titre_de_la_page]
        	);
    }
        /**
    * @Route("/film/{id}", requirements={"id": "\d+"}, name="page_film")
    */
    public function showAction($id)
    {
    	 $films = $this->getDoctrine()->getRepository('DevschoolCinemaBundle:Film')->find($id);
        return $this->render('DevschoolCinemaBundle:Film:show.html.twig',
        	['films' => $films]
        	);
    }
}
