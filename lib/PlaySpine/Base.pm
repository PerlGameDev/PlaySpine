package PlaySpine::Base;

use strict;
use warnings;
use Moose;
use Data::Dumper;

has 'callbacks' => (
    is => 'rw',
    isa => 'HashRef'
);

sub bind  {
    my $self = shift;
    my $tag = shift;
    my $cb = shift;

    my $args = \@_;
    $self->callbacks( {} ) unless defined $self->callbacks(); 
    $self->callbacks()->{$tag} = [] unless defined $self->callbacks()->{$tag};

    push( @{$self->callbacks()->{$tag}}, { callback => $cb, args => $args } );
}

sub trigger {
    my $self = shift;
    my $tag = shift;

    $self->callbacks( {} ) unless defined $self->callbacks(); 
    $self->callbacks()->{$tag} = [] unless defined $self->callbacks()->{$tag};


    foreach my $c_a ( @{$self->callbacks()->{$tag}} ) {
        my $cb = $c_a->{callback};
        my $args = $c_a->{args};
        $cb->( $self, @{$args} );
    }

}

1;

=head1 NAME

PlaySpine::Base - The base of all playspine objects

=head1 SYNOPSIS

This implements bind and trigger methods

=head1 METHOD

=head2 bind

Bind callback and triggers to this object

=head2 trigger

Trigger the binded callbacks

