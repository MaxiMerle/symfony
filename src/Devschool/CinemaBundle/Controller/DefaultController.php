<?php
// src/Devschool/CinemaBundle/Controller/DefaultController.php
namespace Devschool\CinemaBundle\Controller;

use Devschool\CinemaBundle\Entity\Genre;
use Devschool\CinemaBundle\Entity\Realisateur;
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
        $genres = $this->getDoctrine()->getRepository('DevschoolCinemaBundle:Genre')->findAll();
    	$titre_de_la_page = 'Liste de Film';
        return $this->render('DevschoolCinemaBundle:Film:list.html.twig',
        	['films' => $films,'genres' => $genres, 'titre' => $titre_de_la_page]
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




     /**
    * @Route("/realisateurs", name="page_realisateurs")
    */
     public function listRealisateur()
     {

        $realisateurs = $this->getDoctrine()->getRepository('DevschoolCinemaBundle:Realisateur')->findAll();

        $titre_de_la_page = 'Realisateurs';

        return $this->render('DevschoolCinemaBundle:Realisateur:list.html.twig',
            ['realisateurs' => $realisateurs, 'titre' => $titre_de_la_page]
            );
    }

         /**
    * @Route("/realisateurs/{id}", requirements={"id": "\d+"}, name="page_realisateur")
    */
         public function listFilmsRea($id)
         {

            $films = $this->getDoctrine()->getRepository('DevschoolCinemaBundle:Film')->findByRealisateur($id);

            $titre_de_la_page = 'Film de';

            return $this->render('DevschoolCinemaBundle:Film:rea.html.twig',
                ['films' => $films, 'titre' => $titre_de_la_page]
                );
        }
}
