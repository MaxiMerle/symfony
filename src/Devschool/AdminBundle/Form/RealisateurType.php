<?php
namespace Devschool\AdminBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;


class RealisateurType extends AbstractType
{
	public function buildForm(FormBuilderInterface $builder, array $options)
	{
		$builder
		->add('nom')
		->add('prenom')
		->add('naissance')
		->add('save', SubmitType::class, array('label' => 'Enregistrer'))
		;
	}
}

