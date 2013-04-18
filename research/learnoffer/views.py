"""Views for the research prototype."""
from research.learnoffer.forms import AssociationTagBulkForm
from django.shortcuts import render_to_response
from research.learnoffer.models import AssociationTag

def association_tag_bulk_add(request):
    """Adds association tags in bulk from a form. """
    if request.method == "POST":
        form = AssociationTagBulkForm(request.POST)
        if form.is_valid():
            tags = form.cleaned_data['bulk_tags'].split()
            for tag in tags:
                AssociationTag.get_or_create_full_tag(tag)
    else:
        form = AssociationTagBulkForm()
    template = "research/admin/association_tag/bulk_add_form.html"
    return render_to_response(
                              template, 
                              {'form': form})

def association_tag_bulk_delete(request):
    """Adds association tags in bulk from a form. """
    if request.method == "POST":
        form = AssociationTagBulkForm(request.POST)
        if form.is_valid():
            tags = form.cleaned_data['bulk_tags'].split()
            for tag_full in tags:
                for title in tag_full.split('::'):
                    tag = AssociationTag.objects.filter(title=title)
                    if tag.count() == 1 and tag[0].is_leaf_node():
                        tag[0].delete()
    else:
        form = AssociationTagBulkForm()
    template = "research/admin/association_tag/bulk_delete_form.html"
    return render_to_response(
                              template,
                              {'form': form})
