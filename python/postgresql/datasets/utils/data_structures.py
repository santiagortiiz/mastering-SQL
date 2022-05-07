def remove_items_from_list(items, items_to_remove):
    
    if isinstance(items, list) and isinstance(items_to_remove, list):
        items = [i for i in items if i not in items_to_remove]
    
    return items


def remove_items_from_dict(items, items_to_remove):
    
    if isinstance(items, dict) and isinstance(items_to_remove, list):
        for item in items_to_remove:
            if item in items:
                items.pop(item)
            
    return


def remove_items(items, items_to_exclude):
    ''' Arguments:
        items: list or dict
        items_to_exclude: list
    '''
    
    items = remove_items_from_list(items, items_to_exclude)
    remove_items_from_dict(items, items_to_exclude)
    return items


def clean_string(items):
    ''' Remove spaces, dots and hyphens from strings or list of strings '''

    if isinstance(items, list):
        return [i.lower().replace(' ', '_').replace('-', '_').replace('.', '') for i in items]
    
    elif isinstance(items, str):
        return items.lower().replace(' ', '_').replace('-', '_').replace('.', '')