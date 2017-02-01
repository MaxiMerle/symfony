<?php // src/Devschool/AdminBundle/Controller/AdminLivreController.php

namespace Devschool\AdminBundle\Controller;

use Devschool\BiblioBundle\Entity\Livre;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Devschool\AdminBundle\Form\LivreType;

/**
 * @Route("/admin/livres")
 */
class AdminLivreController extends Controller
{
    /**
     * @Route("/ajout", name="admin_livre_ajout")
     */
    public function addAction(Request $request)
    {
        $livre = new Livre();
        $form = $this->createForm(LivreType::class, $livre);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $livre = $form->getData();

            $em = $this->getDoctrine()->getManager();
            $em->persist($livre);
            $em->flush();

            return $this->redirectToRoute('admin_livre_liste');
        }

        return $this->render(
            'DevschoolAdminBundle:Livre:form.html.twig',
            ['form' => $form->createView()]
        );
    }

    /**
     * @Route("/liste", name="admin_livre_liste")
     */
    public function listAction()
    {
        $livres = $this->getDoctrine()->getRepository('DevschoolBiblioBundle:Livre')->findAll();

        return $this->render(
            'DevschoolAdminBundle:Livre:list.html.twig',
            ['livres' => $livres]
        );
    }

    /**
     * @Route("/modif/{id}", name="admin_livre_modif", requirements={"id": "\d+"})
     */
    public function editAction(Request $request, $id)
    {
        $livre = $this->getDoctrine()->getRepository('DevschoolBiblioBundle:Livre')->find($id);

        $form = $this->createForm(LivreType::class, $livre);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $livre = $form->getData();

            $em = $this->getDoctrine()->getManager();
            $em->persist($livre);
            $em->flush();

            return $this->redirectToRoute('admin_livre_liste');
        }

        return $this->render(
            'DevschoolAdminBundle:Livre:form.html.twig',
            ['form' => $form->createView()]
        );
    }

    /**
     * @Route("/supprimer/{id}", name="admin_livre_supprimer", requirements={"id": "\d+"})
     */
    public function deleteAction($id)
    {
        $livre = $this->getDoctrine()->getRepository('DevschoolBiblioBundle:Livre')->find($id);

        $em = $this->getDoctrine()->getManager();
        $em->remove($livre);
        $em->flush();

        return $this->redirectToRoute('admin_livre_liste');
    }
}
