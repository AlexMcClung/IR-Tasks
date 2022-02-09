# -*- coding: utf-8 -*-
"""

Starter Code

Customize this to create Higher Ed examples

"""

# !pip install Faker

from faker import Faker
import pandas as pd

Faker.seed(42)

fake = Faker(locale='en_US')

fake_workers = [
    {'emp_id': '',
     'emp_name': fake.name(),
     'emp_address': fake.address(),
     'emp_dob': fake.date_between(start_date='-60y', end_date='-20y'),
     'emp_salary': fake.random_number(digits=6, fix_len=5),
     'emp_gender': fake.random_element(elements=['M', 'F']),
     'emp_status': fake.random_element(elements=['Active', 'Terminated', 'Resigned'])
    }
    for x in range(100)]

df = pd.DataFrame(fake_workers)

df['emp_id'] = range(101, 201)

df.head()
