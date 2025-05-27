def after_scenario(context, scenario):
    """Clean up after each scenario"""
    if hasattr(context, 'driver'):
        context.driver.quit()