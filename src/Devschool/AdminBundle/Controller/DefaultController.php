<?php

namespace Devschool\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Devschool\AdminBundle\Form\GenreType;
use Devschool\CinemaBundle\Repository\FilmRepository;
use Devschool\CinemaBundle\Entity\Film;
use Devschool\CinemaBundle\Entity\Genre;
use Devschool\CinemaBundle\Entity\Realisateur;
use Devschool\BiblioBundle\Entity\Livre;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;


class DefaultController extends Controller
{
    /**
     * @Route("/")
     */
    public function indexAction()

    {
        return $this->render('DevschoolAdminBundle:default:index.html.twig');
    }
        /**
    * @Route("/admin")
    */
    public function listAction()

    {
    	$films = $this->getDoctrine()->getRepository('DevschoolCinemaBundle:Film')->findAll();
        $livres = $this->getDoctrine()->getRepository('DevschoolBiblioBundle:Livre')->findAll();
        $realisateur = $this->getDoctrine()->getRepository('DevschoolCinemaBundle:Realisateur')->findAll();
    	$titre_de_la_page = 'Liste de Film';
        return $this->render('DevschoolAdminBundle:todo:index.html.twig',
        	['films' => $films,'livres' => $livres, 'realisateur' => $realisateur, 'titre' => $titre_de_la_page]
        	);
    }
            /**
     * @Route("/admin/create" )
     */
    public function createAction(Request $request)
    {
    	$films = new Film;
    	$form = $this ->createFormBuilder($films)
    	->add('titre', TextType::class, array('attr' => array('class' => 'fomr-control', 'style' => 'margin-bottom:15px')))
    	->add('realisateur', EntityType::class, array('class' => 'DevschoolCinemaBundle:Realisateur','choice_label' => 'nom','expanded' => true,))
         ->add('genre', EntityType::class, array( 'class' => 'DevschoolCinemaBundle:Genre','choice_label' => 'nom',))
    	->add('description', TextareaType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))
    	->add('date')
    	->add('Ajouter un Film', SubmitType::class, array('attr' => array('label' => 'Create Film', 'class' => 'btn btn-primary', 'style' => 'margin-bottom:15px')))
    	->getForm();

    	$form->handleRequest($request);
    	if($form->isSubmitted() && $form->isValid()){
    		//Get Data

    		$titre = $form['titre']->getData();
    		$realisateur = $form['realisateur']->getData();
    		$description = $form['description']->getData();
    		$date = $form['date']->getData();
            $genre = $form['genre']->getData();
        

    		$films->setTitre($titre);
    		$films->setRealisateur($realisateur);
    		$films->setDescription($description);
            $films->setDescription($genre);
    		$films->setDate($date);

    		$em = $this->getDoctrine()->getManager();
    		$em->persist($films);
    		$em->flush();

    		$this->addFlash(
    			'notice',
    			'Film Ajouté !'
    			);
    		return $this->redirectToRoute('admin');
    	}

        return $this->render('DevschoolAdminBundle:todo:create.html.twig', array(
        	'form' => $form->createView()
        	));
    }
                /**
     * @Route("/admin/edit/{id}", requirements={"id": "\d+"}, name="page_edit")
     */
    public function editAction($id, Request $request) 
    {
               $films = $this->getDoctrine()
       ->getRepository('DevschoolCinemaBundle:Film')
       ->find($id);

           	$films->setTitre($films->getTitre());
    		$films->setDescription($films->getDescription());
    		$films->setDate($films->getDate());


    	$form = $this ->createFormBuilder($films)
    	->add('titre', TextType::class, array('attr' => array('class' => 'fomr-control', 'style' => 'margin-bottom:15px')))
    	->add('realisateur', EntityType::class, array( // query choices from this entity
    'class' => 'DevschoolCinemaBundle:Realisateur',

    // use the User.username property as the visible option string
    'choice_label' => 'nom',

    // used to render a select box, check boxes or radios
    // 'multiple' => true,
    // 'expanded' => true,
    ))
        ->add('genre', EntityType::class, array( // query choices from this entity
    'class' => 'DevschoolCinemaBundle:Genre',

    // use the User.username property as the visible option string
    'choice_label' => 'nom',

    // used to render a select box, check boxes or radios
    // 'multiple' => true,
    // 'expanded' => true,
    ))
    	->add('description', TextareaType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))
    	->add('date')
    	->add('Modifier le Film', SubmitType::class, array('attr' => array('label' => 'Create Film', 'class' => 'btn btn-primary', 'style' => 'margin-bottom:15px')))
    	->getForm();

    	$form->handleRequest($request);
    	if($form->isSubmitted() && $form->isValid()){
    		//Get Data

    		$titre = $form['titre']->getData();
    		$realisateur = $form['realisateur']->getData();
    		$description = $form['description']->getData();
    		$date = $form['date']->getData();

    		$em = $this->getDoctrine()->getManager();
    		$film = $em->getRepository('DevschoolCinemaBundle:Film')->find($id);

    		$films->setTitre($titre);
    		$films->setRealisateur($realisateur);
    		$films->setDescription($description);
    		$films->setDate($date);



    		$em->flush();

    		$this->addFlash(
    			'notice',
    			'Film Modifié !'
    			);
    		return $this->redirectToRoute('admin');
    	}

 
        return $this->render('DevschoolAdminBundle:todo:edit.html.twig', array(
        	'film' =>$films,
        	'form' => $form->createView()
        	));
    }
                /**
     * @Route("/admin/details/{id}")
     */
    public function detailsAction($id , Request $request)
    {

       $films = $this->getDoctrine()
       ->getRepository('DevschoolCinemaBundle:Film')
       ->find($id);
 
        return $this->render('DevschoolAdminBundle:todo:details.html.twig',
        	['film' => $film]
        	);
    }
          /**
      * @Route("/admin/delete/{id}", name="page_delete")
     */
    public function deleteAction($id)
    {

		$em = $this->getDoctrine()->getManager();
    		$film = $em->getRepository('DevschoolCinemaBundle:Film')->find($id);

    		$em->remove($film);
    		$em->flush();
    		    		$this->addFlash(
    			'notice',
    			'Film Supprimé !'
    			);
    		return $this->redirectToRoute('admin');

    }

      /**
     * @Route("/admin/create/genre" )
     */
    public function createGenreAction(Request $request)
    {
        $genres = new Genre;
        $form = $this ->createFormBuilder($genres)
        ->add('nom', TextType::class, array('attr' => array('class' => 'fomr-control', 'style' => 'margin-bottom:15px')))
        ->add('Ajouter un Genre', SubmitType::class, array('attr' => array('label' => 'Create Film', 'class' => 'btn btn-primary', 'style' => 'margin-bottom:15px')))
        ->getForm();

        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            //Get Data

            $nom = $form['nom']->getData();

            $em = $this->getDoctrine()->getManager();
            $em->persist($genres);
            $em->flush();

            $this->addFlash(
                'notice',
                'Genre Ajouté !'
                );
            return $this->redirectToRoute('admin');
        }

        return $this->render('DevschoolAdminBundle:todo:createGenre.html.twig', array(
            'form' => $form->createView()
            ));
    }























      /**
     * @Route("/admin/create/livre" )
     */
    public function createLivreAction(Request $request)
    {
        $livres = new Livre;
        $form = $this ->createFormBuilder($livres)
        ->add('titre', TextType::class, array('attr' => array('class' => 'fomr-control', 'style' => 'margin-bottom:15px')))
        ->add('auteur', TextType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))
        ->add('description', TextareaType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))
         ->add('nombrePages', TextType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))
        ->add('Ajouter le Livre', SubmitType::class, array('attr' => array('label' => 'Create Film', 'class' => 'btn btn-primary', 'style' => 'margin-bottom:15px')))
        ->getForm();

        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            //Get Data


            $titre = $form['titre']->getData();
            $auteur = $form['auteur']->getData();
            $description = $form['description']->getData();
            $nombrePages = $form['nombrePages']->getData();
            
        

            $livres->setTitre($titre);
            $livres->setAuteur($auteur);
            $livres->setDescription($description);
            $livres->setDescription($nombrePages);

            $em = $this->getDoctrine()->getManager();
            $em->persist($livres);
            $em->flush();
            $this->addFlash(
                'notice',
                'Livre Ajouté !'
                );
            return $this->redirectToRoute('admin');
        }

        return $this->render('DevschoolAdminBundle:todo:createLivre.html.twig', array(
            'form' => $form->createView()
            ));
    }




               /**
     * @Route("/admin/details/{id}")
     */
    public function detailsLivreAction($id , Request $request)
    {

       $livres = $this->getDoctrine()
       ->getRepository('DevschoolCinemaBundle:Livre')
       ->find($id);
 
        return $this->render('DevschoolAdminBundle:todo:detailsLivre.html.twig',
            ['livre' => $livre]
            );
    }
          /**
      * @Route("/admin/delete/{id}", name="page_deleteLivre")
     */
    public function deleteLivreAction($id)
    {

        $em = $this->getDoctrine()->getManager();
            $livre = $em->getRepository('DevschoolBiblioBundle:Livre')->find($id);

            $em->remove($livre);
            $em->flush();
                        $this->addFlash(
                'notice',
                'Livre Supprimé !'
                );
            return $this->redirectToRoute('admin');

    }

              /**
     * @Route("/admin/editLivre/{id}", requirements={"id": "\d+"}, name="page_editLivre")
     */
    public function editLivreAction($id, Request $request) 
    {
               $livres = $this->getDoctrine()
       ->getRepository('DevschoolBiblioBundle:Livre')
       ->find($id);

            $livres->setTitre($livres->getTitre());
            $livres->setAuteur($livres->getAuteur());
            $livres->setDescription($livres->getDescription());
            $livres->setNombrepages($livres->getNombrepages());


        $form = $this ->createFormBuilder($livres)
        ->add('titre', TextType::class, array('attr' => array('class' => 'fomr-control', 'style' => 'margin-bottom:15px')))
        ->add('auteur', TextType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))
        ->add('description', TextareaType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))
        ->add('nombrePages', TextType::class, array('attr' => array('class' => 'form-control', 'style' => 'margin-bottom:15px')))
        ->add('Modifier le Livre', SubmitType::class, array('attr' => array('label' => 'Create Film', 'class' => 'btn btn-primary', 'style' => 'margin-bottom:15px')))
        ->getForm();

        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            //Get Data

            $titre = $form['titre']->getData();
            $auteur = $form['auteur']->getData();
            $description = $form['description']->getData();
            $nombrePages = $form['nombrePages']->getData();
        

            $em = $this->getDoctrine()->getManager();
            $livres = $em->getRepository('DevschoolBiblioBundle:Livre')->find($id);

            $livres->setTitre($titre);
            $livres->setAuteur($auteur);
            $livres->setDescription($description);
            $livres->setNombrepages($nombrePages);



            $em->flush();

            $this->addFlash(
                'notice',
                'Livre Modifié !'
                );
            return $this->redirectToRoute('admin');
        }

 
        return $this->render('DevschoolAdminBundle:todo:editLivre.html.twig', array(
            'livres' =>$livres,
            'form' => $form->createView()
            ));
    }

}








      