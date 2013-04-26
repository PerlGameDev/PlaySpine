package PlaySpine;


use strict;
use warnings FATAL => 'all';

=head1 NAME

PlaySpine - The great new PlaySpine!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01_1';


=head1 SYNOPSIS

This is a side project of to experiment making games using the Backbone/Underscore (javascript libraries) methodology. Basically we will have:


=head2 Model

    package MyModel;
    use base 'PlaySpine::Model';


    package main;

    my $model = MyModel->new();
       $model->set('attr', 'value');

  
=head2 Collection

    package MyCollection;
    use base 'PlaySpine::Collection';

    package main;

    my $col = MyCollection->new( model => 'MyModel' );
    $col->add( MyModel->new({ attr => 'value' });


=head2 Application

    package MyApp;
    use base 'PlaySpine::App';

    package main;

    my $app = MyApp->new();
    $app->run();


=head2 Views & Templates: Very very very work in progress!

    #FILE: template/main.tpl
   
    [ 
        { type => 'BG', location => [0, 0], file=>"foo.png"},

        { type => 'BOX', location => [0, 0], size=> [10, 10], text => $value, attr=>"foo"},

        { type => 'CIRCLE', location => [0, 0, 10], size => [10], color => [255, 0, 255, 255] }, 

        { type => 'SPRITE', location => [$x, 20 ], size =>[ 10, 10],  texture => $foo },

        { type => 'CUBE', location => [0,0,0], size=>[ 5, 5, 5] }# OpenGL 3D?!?! why the heck not!
    ]        


Templates are just perl array hashes each 'TYPE' is defined with a class that renders and managages it. This class's instance is passed to the callback handlers in the view and if it binded.

    #FILE: view/main.pl
    package MyView;
    use base 'PlaySpine::View';

    has events => {
        "click box" => "on_box_click",
        "mouseover circle" => "on_circle_over",
        "click [attr='foo']" => "on_box_click" #COOL SELECTORS!
    };

    has template => 'main'; #default is name of view in template/MyView

    sub initialize {
        my $self = shift;

        $self->template( { value => $value, foo => 'asdasd', x => 20 } );
    }

    sub on_box_click {
        my $self = shift;
        my $obj = shift; # In this case SDL Surface 
    }

    sub on_circle_over {
        ...
    }


=head2 Events on Models!

    my $model = MyModel->new();
    
    $model->trigger('created');

    $model->bind('created', sub { print 'created'; } );

    #For anything with a PlaySpine Base which is View, Collection, App, Model, and so on
    $any_ps_base->bind();
    $any_ps_base->trigger();


=head1 AUTHOR

Kartik Thakore, C<< <kthakore at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests through
the web interface at L<https://github.com/PerlGameDev/PlaySpine/issues>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc PlaySpine


You can also look for information at:

=over 4

=item * GitHub Issue Tracker (report bugs here)

L<https://github.com/PerlGameDev/PlaySpine/issues>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/PlaySpine>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/PlaySpine>

=item * Search CPAN

L<http://search.cpan.org/dist/PlaySpine/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Kartik Thakore.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of PlaySpine
