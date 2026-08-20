-- Insert portfolio website project
INSERT INTO projects (
  title, 
  slug, 
  description, 
  link_demo, 
  link_github, 
  stacks, 
  content, 
  is_featured
) VALUES (
  'Portfolio Website', 
  'portfolio', 
  'Personal portfolio website showcasing projects, skills, and contact information with smooth animations and responsive design.', 
  'https://rafighaly.com', 
  'https://github.com/rafighaly/portfolio', 
  ARRAY['Next.js', 'TypeScript', 'TailwindCSS', 'Framer Motion'], 
  '# Portfolio Website\n\nA modern personal portfolio built with Next.js, TypeScript, and Tailwind CSS. Features smooth animations, responsive design, and optimized performance.', 
  true
);

-- Insert rentcar website project
INSERT INTO projects (
  title, 
  slug, 
  description, 
  link_demo, 
  link_github, 
  stacks, 
  content, 
  is_featured
) VALUES (
  'RentCar Website', 
  'rentcar', 
  'Car rental platform with booking system, vehicle management, and payment integration.', 
  'https://rentcar-demo.com', 
  'https://github.com/username/rentcar', 
  ARRAY['Laravel', 'PHP', 'MySQL', 'TailwindCSS', 'JavaScript'], 
  '# RentCar Website\n\nA comprehensive car rental management system built with Laravel. Features include vehicle catalog, booking system, and payment processing.', 
  false
);

-- Update TryNow project with proper data
UPDATE projects SET 
  title = 'TryNow',
  description = 'Modern task management application with real-time collaboration features.',
  link_demo = 'https://trynow-demo.com',
  link_github = 'https://github.com/username/trynow',
  stacks = ARRAY['Laravel', 'PHP', 'MySQL', 'TailwindCSS'],
  content = '# TryNow\n\nA modern task management application built with Laravel. Features include real-time collaboration, task tracking, and team management.',
  is_featured = true
WHERE slug = 'trynow';
