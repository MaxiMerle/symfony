<?php

// src/Devschool/BiblioBundle/Controller/DefaultController.php
namespace Devschool\BiblioBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="page_accueil")
     */
    public function indexAction()
    {
        return $this->render('DevschoolBiblioBundle:Default:index.html.twig');
    }

    /**
     * @Route("/livres", name="page_livres")
     */
    public function listAction()
    {
        $livres = $this->getDoctrine()->getRepository('DevschoolBiblioBundle:Livre')->findAll();

        $titre_de_la_page = 'Liste des Livres';

        return $this->render(
            'DevschoolBiblioBundle:Livre:list.html.twig',
            ['livres' => $livres, 'titre' => $titre_de_la_page]
        );
    }

    /**
     * @Route("/livre/{id}", requirements={"id": "\d+"}, name="page_livre")
     */
    public function showAction($id)
    {
        $livre = $this->getDoctrine()->getRepository('DevschoolBiblioBundle:Livre')->find($id);

        return $this->render(
            'DevschoolBiblioBundle:Livre:show.html.twig',
            ['livre' => $livre]
        );
    }


}